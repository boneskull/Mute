import Foundation
import AppKit

let appId = "com.apple.notificationcenterui" as CFString

public final class MuteCore {
  private let arguments: [String]

  public init(arguments: [String] = CommandLine.arguments) {
    self.arguments = arguments
  }

  public func run() throws {
    if arguments.count < 2 || arguments[1] != "off" {
      enableDoNotDisturb()
    } else {
      disableDoNotDisturb()
    }
    save()
  }

  private func enableDoNotDisturb() {
    CFPreferencesSetValue("dndStart" as CFString, 0 as CFPropertyList, appId, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost)
    CFPreferencesSetValue("dndEnd" as CFString, 1439 as CFPropertyList, appId, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost)
    CFPreferencesSetValue("doNotDisturb" as CFString, true as CFPropertyList, appId, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost)
    print("mute: do not disturb enabled")
  }

  private func disableDoNotDisturb() {
    CFPreferencesSetValue("dndStart" as CFString, nil, appId, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost)
    CFPreferencesSetValue("dndEnd" as CFString, nil, appId, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost)
    CFPreferencesSetValue("doNotDisturb" as CFString, false as CFPropertyList, appId, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost)
    print("mute: do not disturb disabled")
  }

  private func save() {
    CFPreferencesSynchronize(appId, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost)
  }

}
