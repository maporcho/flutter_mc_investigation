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
        print("vovo - args: \(args)")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            mc.invokeMethod("nativeCallSomeFlutterMethod", arguments: nil)
        }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
