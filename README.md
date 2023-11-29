# github-util
Utility files for working with GitHub, including IBM GitHub Enterprise (GHE).

See 
* [GitHub REST API](https://docs.github.com/en/rest)
* [jq tool](https://jqlang.github.io/jq/manual/) for parsing JSON from shell
* [jq Playground](https://jqplay.org/) for testing jq parsing

## Get Release Jar for Maven
[get-release-as-maven-dependency.sh](get-release-as-maven-dependency.sh)

This script can be called to retrieve a jar from a repo's Releases, and add it to the local Maven repo cache. Suitable either for calling from within GitHub environment, like with Travis CI, or for artifacts that aren't in any remote Maven repos.

See https://docs.github.com/en/rest/releases/releases

## Create and push Tag

[gitag](gitag)

## Create Tag and Milestone together

[gtm](gtm)

Our current team pattern is to create milestones with most tags, so we can assign Issues to a Milestone and know which builds contain which Issues

See https://docs.github.com/en/rest/issues/milestones
