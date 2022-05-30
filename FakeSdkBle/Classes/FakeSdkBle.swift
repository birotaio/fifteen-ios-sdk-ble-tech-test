public class BikeData {
    public var serialNumber: String?
    public var batteryLevel: Int?
    public var isConnected: Bool
    public var isLock: Bool

    init(serialNumber: String?) {
        self.serialNumber = serialNumber
        self.batteryLevel = nil
        self.isConnected = false
        self.isLock = true
    }
}

public enum ErrorBLE: String {
    case alreadyConnected = "already Connect"
    case notConnected = "not Connected"
    case alreadyUnlock = "already unlock"
    case alreadyLock = "already lock"
    case bleError = "ble error"
}

public class FakeSdkBle {
    public static let sharedInstance = FakeSdkBle()
    public var bikeData = BikeData(serialNumber: nil)


    public func connect(serialNumber: String, onSuccess: @escaping() -> Void, onFailure: @escaping(ErrorBLE) -> Void)
    {
        let randomInt = Int.random(in: 0..<10)

        if self.bikeData.isConnected {
            onFailure(.alreadyConnected)
            return
        }
        sleep(1)
        if randomInt >= 8 {
            onFailure(.bleError)
        }
        else {
            self.bikeData.serialNumber = serialNumber
            self.bikeData.isConnected = true
            self.bikeData.batteryLevel = Int.random(in: 0..<101)
            onSuccess()
        }
    }

    public func unlock(onSuccess: @escaping() -> Void, onFailure: @escaping(ErrorBLE) -> Void) {
        let randomInt = Int.random(in: 0..<10)

        if self.bikeData.isConnected == false {
            onFailure(.notConnected)
            return
        }
        if self.bikeData.isLock == false {
            onFailure(.alreadyUnlock)
            return
        }
        
        sleep(1)
        if randomInt == 9 {
            onFailure(.bleError)
        }
        else {
            self.bikeData.isLock = false
            onSuccess()
        }
    }

    public func lock(onSuccess: @escaping() -> Void, onFailure: @escaping(ErrorBLE) -> Void) {
        let randomInt = Int.random(in: 0..<10)

        if self.bikeData.isConnected == false {
            onFailure(.notConnected)
            return
        }
        if self.bikeData.isLock == true {
            onFailure(.alreadyLock)
            return
        }
        
        sleep(1)
        if randomInt == 9 {
            onFailure(.bleError)
        }
        else {
            self.bikeData.isLock = true
            onSuccess()
        }
    }

    public func disconnect() {
        sleep(1)
        self.bikeData.isConnected = false
        print("Disconnect")
    }
}
