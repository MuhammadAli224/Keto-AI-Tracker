import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, UIDocumentPickerDelegate, UIAdaptivePresentationControllerDelegate {
  private var pendingExport: (directory: URL, result: FlutterResult)?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if let controller = window?.rootViewController as? FlutterViewController {
      FlutterMethodChannel(
        name: "keto_tracker/export",
        binaryMessenger: controller.binaryMessenger
      ).setMethodCallHandler { [weak self, weak controller] call, result in
        guard call.method == "save" else {
          result(FlutterMethodNotImplemented)
          return
        }
        guard let self, let controller, let bytes = call.arguments as? FlutterStandardTypedData,
              self.pendingExport == nil, controller.presentedViewController == nil else {
          result(FlutterError(code: "export_unavailable", message: nil, details: nil))
          return
        }
        self.showExport(bytes.data, controller: controller, result: result)
      }
      FlutterMethodChannel(
        name: "keto_tracker/photos",
        binaryMessenger: controller.binaryMessenger
      ).setMethodCallHandler { call, result in
        guard call.method == "privateDirectory" else {
          result(FlutterMethodNotImplemented)
          return
        }
        do {
          let manager = FileManager.default
          let support = try manager.url(
            for: .applicationSupportDirectory, in: .userDomainMask,
            appropriateFor: nil, create: true
          )
          var directory = support.appendingPathComponent("meal_photos", isDirectory: true)
          try manager.createDirectory(
            at: directory, withIntermediateDirectories: true,
            attributes: [.protectionKey: FileProtectionType.completeUntilFirstUserAuthentication]
          )
          var values = URLResourceValues()
          values.isExcludedFromBackup = true
          try directory.setResourceValues(values)
          result(directory.path)
        } catch {
          result(FlutterError(code: "photo_directory_unavailable", message: nil, details: nil))
        }
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func showExport(_ bytes: Data, controller: UIViewController, result: @escaping FlutterResult) {
    let manager = FileManager.default
    let directory = manager.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
    let file = directory.appendingPathComponent("keto-tracker-export.json")
    do {
      try manager.createDirectory(at: directory, withIntermediateDirectories: false)
      try bytes.write(to: file, options: [.atomic, .completeFileProtection])
      let picker = UIDocumentPickerViewController(forExporting: [file], asCopy: true)
      picker.delegate = self
      picker.presentationController?.delegate = self
      pendingExport = (directory, result)
      controller.present(picker, animated: true)
    } catch {
      try? manager.removeItem(at: directory)
      result(FlutterError(code: "export_failed", message: nil, details: nil))
    }
  }

  func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
    finishExport(saved: !urls.isEmpty)
  }

  func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
    finishExport(saved: false)
  }

  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    if presentationController.presentedViewController is UIDocumentPickerViewController {
      finishExport(saved: false)
    }
  }

  private func finishExport(saved: Bool) {
    guard let export = pendingExport else { return }
    pendingExport = nil
    try? FileManager.default.removeItem(at: export.directory)
    export.result(saved)
  }
}
