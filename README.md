# LoLAPI

LoLAPI is the most powerful Objective-C RESTful client for the popular online game "League of Legends" by Riot Games. All available web services exposed by the official League of Legends API come fully object mapped, allowing developers to focus on writing their LoL applications without the hassle (or knowledge) of network setup and web service consumption.

## Getting Started

- [Download LoLAPI](https://github.com/troystump/LoLAPI/releases)

To begin using LoLAPI in your project, simply setup your League of Legends API key and desired region by following the example:

``` objective-c
#import <LoLAPI/LoLAPI.h>
...

// Initialize the LoLAPI
[LoLAPIManager initWithAPIKey:@"<your_key>" region:LoLRegionIDNorthAmerica];
```

## Requirements

LoLAPI requires [iOS 5.0](http://developer.apple.com/library/ios/#releasenotes/General/WhatsNewIniPhoneOS/Articles/iOS5.html#//apple_ref/doc/uid/TP30915195-SW1) and above or [Mac OS X 10.7](http://developer.apple.com/library/mac/#releasenotes/MacOSX/WhatsNewInOSX/Articles/MacOSX10_7.html#//apple_ref/doc/uid/TP40010355-SW5) and above.

LoLAPI depends on the following third party, open source libraries:

1. [RestKit](https://github.com/RestKit/RestKit) - Networking Support, Object Mapping (integrated with Core Data)

The following Cocoa frameworks must be linked into the application target for proper compilation:

1. **CFNetwork.framework** on iOS
1. **CoreData.framework**
1. **Security.framework**
1. **MobileCoreServices.framework** on iOS or **CoreServices.framework** on OS X

And the following linker flags must be set:

1. **-ObjC**
1. **-all_load**

### ARC

The LoLAPI codebase is completely written using ARC.

If you are including the LoLAPI sources directly into a project that does not yet use [Automatic Reference Counting](http://clang.llvm.org/docs/AutomaticReferenceCounting.html), you will need to set the `-fobjc-arc` compiler flag on all of the RestKit source files. To do this in Xcode, go to your active target and select the "Build Phases" tab. Now select all RestKit source files, press Enter, insert `-fobjc-arc` and then "Done" to enable ARC for RestKit.

## Installation

The recommended approach for installing LoLAPI is via the [CocoaPods](http://cocoapods.org/) package manager, as it provides flexible dependency management and dead simple installation. For best results, it is recommended that you install via CocoaPods **>= 0.19.1** using Git **>= 1.8.0** installed via Homebrew.

### via CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Change to the directory of your Xcode project, and Create and Edit your Podfile and add RestKit:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
platform :ios, '5.0' 
# Or platform :osx, '10.7'
pod 'LoLAPI', '~> 0.1.0'
```

Install into your project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file)

``` bash
$ open MyProject.xcworkspace
```

Please note that if your installation fails, it may be because you are installing with a version of Git lower than CocoaPods is expecting. Please ensure that you are running Git **>= 1.8.0** by executing `git --version`. You can get a full picture of the installation details by executing `pod install --verbose`.

### From a Release Package or as a Git submodule

If you have successful instructions on how to install using this method, please share with me so that I can begin a wiki for others to see.

## License

LoLAPI is licensed under the terms of the [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). Please see the [LICENSE](LICENSE) file for full details.

## Credits

LoLAPI is brought to you by [Troy Stump](http://twitter.com/troystump).
Special thanks to [Blake Watters](http://twitter.com/blakewatters) and the RestKit team for their amazing framework.
