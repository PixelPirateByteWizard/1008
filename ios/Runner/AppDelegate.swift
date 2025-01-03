import Flutter
import UIKit
import AppTrackingTransparency
import QetovoninemeRegister

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    QetovoninemeCZHomeRegister.initQetovoninemeModule()
           DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                // 处理授权结果
            }
        }
    }
    return result
  }
  
  override func applicationDidBecomeActive(_ application: UIApplication) {
    super.applicationDidBecomeActive(application)
    QetovoninemeCZHomeRegister.QetovoninemeconfigIdfRequest()
  }
}
