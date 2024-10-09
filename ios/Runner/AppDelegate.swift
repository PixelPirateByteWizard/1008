import Flutter
import UIKit
//import PrioriteaseneedRegister

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // ... existing code ...
    
    // Initialize Prioriteaseneed module
//    PrioriteaseneedCZHomeRegister.initPrioriteaseneedModule()
//      NSException(name:NSExceptionName(rawValue: "Crash"), reason:"Crash.", userInfo:nil).raise()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  override func applicationDidBecomeActive(_ application: UIApplication) {
    super.applicationDidBecomeActive(application)
    
    // Call PrioriteaseneedconfigIdfRequest method
//    PrioriteaseneedCZHomeRegister.PrioriteaseneedconfigIdfRequest()
  }
}
