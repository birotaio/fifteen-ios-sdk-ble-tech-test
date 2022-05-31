# FakeSdkBle

[![CI Status](https://img.shields.io/travis/cobeque/FakeSdkBle.svg?style=flat)](https://travis-ci.org/cobeque/FakeSdkBle)
[![Version](https://img.shields.io/cocoapods/v/FakeSdkBle.svg?style=flat)](https://cocoapods.org/pods/FakeSdkBle)
[![License](https://img.shields.io/cocoapods/l/FakeSdkBle.svg?style=flat)](https://cocoapods.org/pods/FakeSdkBle)
[![Platform](https://img.shields.io/cocoapods/p/FakeSdkBle.svg?style=flat)](https://cocoapods.org/pods/FakeSdkBle)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
You got 4 calls:
  Connect    ===> Start a fake connection with a bike
                  Error already connect
                  Error Ble
  Unlock     ===> Try to fake unlock a bike
                  Error not connected
                  Error already unlock
                  Error Ble
  Lock       ===> Try to fake lock a bike
                  Error not connected
                  Error already lock
                  Error Ble
  Disconnect ===> End connection
                  Can't fail

## Requirements

## Installation

FakeSdkBle is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FakeSdkBle'
```

## License

FakeSdkBle is available under the MIT license. See the LICENSE file for more info.
