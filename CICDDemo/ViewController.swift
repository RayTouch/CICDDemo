//
//  ViewController.swift
//  CICDDemo
//
//  Created by Ray on 2019/6/28.
//  Copyright © 2019 Ray. All rights reserved.

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    private var data: NSMutableDictionary?
    private var peripheralmanager: CBPeripheralManager?
    
    private var locationManager: CLLocationManager?
    
    private var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 測試用
        self.myTableView.dataSource = self
        // 哪裏?
        self.searchBeacon()
    }
    
    func testNumber(first: Int, second: Int) -> Int {
        return first + second + 1
    }
    
    /// search iBeacon
    private func searchBeacon() {
        guard let uuid = UUID(uuidString: "A77A1B68-49A7-4DBF-914C-760D07FBB87B") else { return }
        
        let beaconManager = CLBeaconRegion(proximityUUID: uuid, identifier: "open")
        
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        
        self.locationManager?.requestWhenInUseAuthorization()
        
        self.locationManager?.startMonitoring(for: beaconManager)
        self.locationManager?.startRangingBeacons(in: beaconManager)
        
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
}
extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        guard CLLocationManager.isRangingAvailable() else { return }
        //manager.startRangingBeacons(in: region as! CLBeaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        self.items = beacons.compactMap({ "\($0.proximityUUID.uuidString)" })
        self.myTableView.reloadData()
        //print("did beacons")
    }
    func locationManager(_ manager: CLLocationManager, rangingBeaconsDidFailFor region: CLBeaconRegion, withError error: Error) {
        print("error = \(error)")
    }
}
