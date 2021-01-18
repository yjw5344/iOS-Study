//
//  ViewController.swift
//  mission8
//
//  Created by Jungwon on 2021/01/05.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var lb1LocationInfo1: UILabel!
    @IBOutlet var lb1LocationInfo2: UILabel!
    @IBOutlet var myMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lb1LocationInfo1.text = ""
        lb1LocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lb1LocationInfo1.text = "현재 위치"
            self.lb1LocationInfo2.text = address
            })
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lb1LocationInfo1.text = ""
            self.lb1LocationInfo2.text = ""
            locationManager.startUpdatingLocation()
       } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lb1LocationInfo1.text = "보고 계신 위치"
            self.lb1LocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
       } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lb1LocationInfo1.text = "보고 계신 위치"
            self.lb1LocationInfo2.text = "이지스퍼블리싱 출판사 "
       } else if sender.selectedSegmentIndex == 3 {
            setAnnotation(latitudeValue: 37.507241265076445, longitudeValue: 127.05859266213788, delta: 0.1, title: "Autoever", subtitle: "서울시 강남구 대치동 루첸타워 510")
            self.lb1LocationInfo1.text = "보고 계신 위치"
            self.lb1LocationInfo2.text = "HAE "
       }
    }
    
}

