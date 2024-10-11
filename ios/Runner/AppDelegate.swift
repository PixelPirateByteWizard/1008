import Flutter
import UIKit
import MilaioPutongAppinfo

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Initialize MilaioPutongMoudle
    MilaioPutongManagerTool.shareInstance().initMilaioPutongMoudle()
    
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
