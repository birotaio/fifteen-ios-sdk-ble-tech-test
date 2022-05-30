//
//  ViewController.swift
//  FakeSdkBle
//
//  Created by cobeque on 05/24/2022.
//  Copyright (c) 2022 cobeque. All rights reserved.
//

import UIKit
import FakeSdkBle

class ViewController: UIViewController {

    var bikeData = FakeSdkBle.sharedInstance.bikeData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Connect(_ sender: Any) {
        FakeSdkBle.sharedInstance.connect(serialNumber: "103480", onSuccess: {
            print("Success connect")
        }, onFailure: { (err) in
            print("Error connect \(err)")
        })
    }
    
    @IBAction func Start(_ sender: Any) {
        FakeSdkBle.sharedInstance.unlock(onSuccess: {
            print("Success start")
        }, onFailure: { (err) in
            print("Error start \(err)")
        })
    }
    
    @IBAction func End(_ sender: Any) {
        FakeSdkBle.sharedInstance.lock(onSuccess: {
            print("Success end")
        }, onFailure: { (err) in
            print("Error end \(err)")
        })
    }
    
    @IBAction func Disconnect(_ sender: Any) {
        FakeSdkBle.sharedInstance.disconnect()
    }
    
}

