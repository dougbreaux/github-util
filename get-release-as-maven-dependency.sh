#!/bin/bash

# Get a specified jar dependency from another GitHub Enterprise repo's Releases,
# and place it into the local Maven repo cache. Uses the latest Release.
# Set the CREDS environment variable to 'username:token'.
#
# Usage:
#       get-release-as-maven-dependency.sh <owner/repo> <Maven-groupId-path> <Maven-artifactId> <Maven-version> [tag]
# Example:
#       /bin/bash get-release-as-maven-dependency.sh my-org/my-util-library com/ibm/us/breaux MyUtil 1.0
#
# Pointers and techniques from:
#  https://github.ibm.com/river/edna/blob/master/build-utils/stages.sh

# for debugging only
#set -x

# GitHub Enterprise API URL
# https://developer.github.com/v3/
API_URL="https://${CREDS}@github.ibm.com/api/v3/repos"

REPO=$1
# TODO convert from Maven dot-form groupId
M2_PATH=$2
M2_ARTIFACT=$3
M2_VERSION=$4

# Retrieve and store the specified Asset file.
# Arguments: 
# 1. GitHub repo path (owner/repo)
# 2. File name (e.g. MyUtil-1.0.jar)
# 3. Where to store the asset file
# 4. (Optional) specific tag
function get_asset {
	local repo="$1"
	local asset="$2"
	local output="$3"
	local tag="$4"
	
	local repo_url="${API_URL}/$repo/releases"
	
	if [ -z "$tag" ]; then
		local asset_id=$(curl -s "$repo_url/latest" | jq ".assets[] | select(.name == \"$asset\").id")
	else
		local asset_id=$(curl -s "$repo_url/tags/$tag" | jq ".assets[] | select(.name == \"$asset\").id")
	fi
		
	curl -s -H "Accept: application/octet-stream" -L "$repo_url/assets/$asset_id" --output $output/$version${asset}
}

# Maven local repository location, create if doesn't exist
REPO_LOC=$HOME/.m2/repository/$M2_PATH/$M2_VERSION
mkdir -p $REPO_LOC

if [ -z $5 ]; then
	echo get_asset $REPO ${M2_ARTIFACT}-${M2_VERSION}.jar "$REPO_LOC"
	get_asset $REPO ${M2_ARTIFACT}-${M2_VERSION}.jar "$REPO_LOC"
else
	echo get_asset $REPO ${M2_ARTIFACT}-${M2_VERSION}.jar "$REPO_LOC" $5
	get_asset $REPO ${M2_ARTIFACT}-${M2_VERSION}.jar "$REPO_LOC" $5
fi	