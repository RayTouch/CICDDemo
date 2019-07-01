//
//  StartBeaconViewController.swift
//  CICDDemo
//
//  Created by Ray on 2019/7/1.
//  Copyright © 2019 Ray. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class StartBeaconViewController: UIViewController {

    private var data: NSMutableDictionary?
    private var peripheralmanager: CBPeripheralManager?
    
    private var canOpen: Bool = false
    private var isOpen: Bool = true
    
    @IBAction func startAction(_ sender: UIButton) {
        guard self.canOpen else { return }
        self.isOpen ? self.stopAdvertising(sender) : self.startAdvertising(sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.openBeacon()
    }
    
    private func startAdvertising(_ sender: UIButton) {
        guard let manager = self.peripheralmanager else { return }
        guard let data = self.data as? [String: Any] else { return }
        manager.startAdvertising(data)
        sender.setTitle("結束廣播", for: .normal)
        self.isOpen = true
    }
    private func stopAdvertising(_ sender: UIButton) {
        guard let manager = self.peripheralmanager else { return }
        manager.stopAdvertising()
        sender.setTitle("開始廣播", for: .normal)
        self.isOpen = false
    }

    /// iBeacon 推播
    private func openBeacon() {
        guard let uuid = UUID(uuidString: "A77A1B68-49A7-4DBF-914C-760D07FBB87B") else { return }
        
        let beaconManager = CLBeaconRegion(proximityUUID: uuid, major: 1, minor: 1, identifier: "open")
        
        self.data = beaconManager.peripheralData(withMeasuredPower: nil)
        
        self.peripheralmanager = CBPeripheralManager(delegate: self, queue: nil)
    }
}
extension StartBeaconViewController: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            print("open")
            self.canOpen = true
            break
        case .poweredOff:
            self.canOpen = false
            break
        default:
            print("啥")
            break
        }
    }
}
