public class BikeData {
    public var serialNumber: Int?
    public var batteryLevel: Int?
    public var isConnected: Bool
    public var inTrip: Bool

    init(serialNumber: Int?) {
        self.serialNumber = serialNumber
        self.batteryLevel = nil
        self.isConnected = false
        self.inTrip = false
    }
}

public enum ErrorBLE: String {
    case alreadyConnected = "already Connect"
    case notConnected = "not Connected"
    case alreadyInTrip = "already in trip"
    case notInTrip = "not in trip"
    case bleError = "ble error"
}

public class FakeSdkBle {
    public static let sharedInstance = FakeSdkBle()
    public var bikeData = BikeData(serialNumber: nil)


    public func connect(serialNumber: Int, onSuccess: @escaping() -> Void, onFailure: @escaping(ErrorBLE) -> Void)
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

    public func startTrip(onSuccess: @escaping() -> Void, onFailure: @escaping(ErrorBLE) -> Void) {
        let randomInt = Int.random(in: 0..<10)

        if self.bikeData.isConnected == false {
            onFailure(.notConnected)
            return
        }
        if self.bikeData.inTrip {
            onFailure(.alreadyInTrip)
            return
        }
        
        sleep(1)
        if randomInt == 9 {
            onFailure(.bleError)
        }
        else {
            self.bikeData.inTrip = true
            onSuccess()
        }
    }

    public func endTrip(onSuccess: @escaping() -> Void, onFailure: @escaping(ErrorBLE) -> Void) {
        let randomInt = Int.random(in: 0..<10)

        if self.bikeData.isConnected == false {
            onFailure(.notConnected)
            return
        }
        if self.bikeData.inTrip == false {
            onFailure(.notInTrip)
            return
        }
        
        sleep(1)
        if randomInt == 9 {
            onFailure(.bleError)
        }
        else {
            self.bikeData.inTrip = false
            onSuccess()
        }
    }

    public func disconnect() {
        sleep(1)
        self.bikeData.isConnected = false
        print("Disconnect")
    }
}
