import CoreBluetooth
import Foundation

/// Wrapper for CBCentralManager initialization configurations when starting a new Bluejay instance.
public struct StartOptions {
    /// Whether to show an iOS system alert when Bluetooth is turned off while the app is still
    /// running in the background.
    var enableBluetoothAlert: Bool
    #if os(iOS)
    /// Enable or disable state restoration.
    var backgroundRestore: BackgroundRestoreMode
    #endif

    /// Configurations for starting Bluejay.
    ///
    /// - Parameters:
    ///    - enableBluetoothAlert: whether to show an iOS system alert when Bluetooth is turned off
    /// while the app is still running in the background.
    ///    - backgroundRestore: enable or disable state restoration.
    #if os(iOS)
    public init(enableBluetoothAlert: Bool, backgroundRestore: BackgroundRestoreMode = .disable) {
        self.enableBluetoothAlert = enableBluetoothAlert
        self.backgroundRestore = backgroundRestore
    }
    #else
    public init(enableBluetoothAlert: Bool) {
        self.enableBluetoothAlert = enableBluetoothAlert
    }
    #endif

    /// Convenience factory method to avoid having to use the public initializer.
    public static var `default`: StartOptions {
        StartOptions(enableBluetoothAlert: false)
    }
}

/// Specifies whether to start a new Bluejay instance from scratch, or from an existing
/// CoreBluetooth session.
public enum StartMode {
    /// Start Bluejay using a new CBCentralManager.
    case new(StartOptions)
    /// Start Bluejay using an existing CBCentralManager.
    case use(manager: CBCentralManager, peripheral: CBPeripheral?)
}
