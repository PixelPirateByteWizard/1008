import Flutter
import UIKit
import EncryptrixMeazaRegister

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    EncryptrixMeazaCZHomeRegister.initEncryptrixMeazaModule() 
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
