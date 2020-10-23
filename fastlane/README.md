fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios unit_tests
```
fastlane ios unit_tests
```
Run iOS unit tests
### ios increment_major_version
```
fastlane ios increment_major_version
```
Increment major version and push to git
### ios increment_minor_version
```
fastlane ios increment_minor_version
```
Increment minor version and push to git
### ios increment_patch_version
```
fastlane ios increment_patch_version
```
Increment patch version and push to git

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
