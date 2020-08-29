//
//  ViewController.swift
//  MapTest
//
//  Created by 川田広輝 on 2020/08/08.
//  Copyright © 2020 川田広輝. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputText.delegate = self
    }

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispMap: MKMapView!
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let key = textField.text {
            print(key)
            
            let gecoder = CLGeocoder()
            
            gecoder.geocodeAddressString(key,completionHandler: {(mark,error) in
                if let unwerapmarks = mark {
                    if let first = unwerapmarks.first {
                        if let location = first.location {
                            let targetCoordinate = location.coordinate
                            print(targetCoordinate)
                            let pin = MKPointAnnotation()
                            pin.coordinate = targetCoordinate
                            pin.title = key
                            self.dispMap.addAnnotation(pin)
                            self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0,longitudinalMeters: 500.0)
                        }
                    }
                }
            })
        }
        
        
        
        return true
    }
}

