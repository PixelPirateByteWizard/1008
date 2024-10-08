import Flutter
import UIKit
import SecuroliGongjuRegister

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    SecuroliGongjuCZHomeRegister.initSecuroliGongjuModule()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
