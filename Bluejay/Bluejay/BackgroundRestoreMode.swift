import Foundation
#if os(iOS)
/// Determines how Bluejay should opt-in to CoreBluetooth state restoration.
public enum BackgroundRestoreMode {
    /// Bluejay will not start CoreBluetooth with state restoration.
    case disable
    /// Bluejay will start CoreBluetooth with state restoration.
    case enable(BackgroundRestoreConfig)
}
#endif
