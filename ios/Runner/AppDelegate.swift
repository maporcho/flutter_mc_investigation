import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let mc = FlutterMethodChannel(name: "sample.method.channel",
                                              binaryMessenger: controller.binaryMessenger)

    mc.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        let args = call.arguments as! Dictionary<String, Any>
//        let aBoolean_NSNumber = (args["aBoolean"] as? NSNumber)?.boolValue
//        let aBoolean_Bool = args["aBoolean"] as? Bool
//        print("vovo - aBoolean_NSNumber: \(aBoolean_NSNumber)")
//        print("vovo - aBoolean_Bool: \(aBoolean_Bool)")
        print("vovo - args: \(args)")
    })                               

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
