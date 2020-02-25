# github-util
Utility files for working with GitHub, including IBM GitHub Enterprise (GHE).

See 
* [GitHub API](https://developer.github.com/v3/)
* [jq tool](https://stedolan.github.io/jq/manual/) for parsing JSON from shell
* [jq Plaground](https://jqplay.org/) for testing jq parsing

## Get Release Jar for Maven
[get-release-as-maven-depency.sh](https://github.ibm.com/breaux/github-util/blob/master/get-release-as-maven-dependency.sh)

This script can be called to retrieve a jar from a repo's Releases, and add it to the local Maven repo cache. Suitable either for calling from within GitHub environment, like with Travis CI, or for artifacts that aren't in any remote Maven repos.

See https://developer.github.com/v3/repos/releases/

## Create Tag and Milestone together

[gitag](https://github.ibm.com/breaux/github-util/blob/master/gitag)

Our current team pattern is to create milestones with most tags, so we can assign Issues to a Milestone and know which builds contain which Issues

See https://developer.github.com/v3/issues/milestones/
