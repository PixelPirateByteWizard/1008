import Flutter
import UIKit
import VeloriachengRegister

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
    // 初始化 Veloriacheng 模块
    VeloriachengCZHomeRegister.initVeloriachengModule()
    
    return result
  }
}
