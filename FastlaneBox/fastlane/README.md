fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios my_action
```
fastlane ios my_action
```
Custom action
### ios lint
```
fastlane ios lint
```
Analyze codes

This may comment to pull request
### ios sync
```
fastlane ios sync
```
Runs synx to folderize the Xcode project
### ios test
```
fastlane ios test
```
Runs all the unit and ui tests
### ios report_test_coverage
```
fastlane ios report_test_coverage
```
Calcucate test code covearge score. Need to run test before this
### ios screens
```
fastlane ios screens
```
Creates new screenshots and uploads them to iTunes Connect
### ios upload
```
fastlane ios upload
```
Upload a new version to the appetize.io
### ios beta
```
fastlane ios beta
```
Submit a new Beta Build to Apple TestFlight

This will also make sure the profile is up to date
### ios release
```
fastlane ios release
```
Deploy a new version to the App Store

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).