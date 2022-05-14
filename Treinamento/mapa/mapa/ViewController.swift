//
//  ViewController.swift
//  mapa
//
//  Created by Juliane Lopes on 07/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Passo3: gerenciador
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Passo 1: localizacao no mapa -23.53332571723464, -46.54254299908146
        let latitude: CLLocationDegrees = -23.53332571723464
        let longitude: CLLocationDegrees = -46.54254299908146
        
        let deltaLagitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLagitude, longitudeDelta: deltaLongitude)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
       
        map.setRegion(region, animated: true)
        
        // Passo 2: anotacao no mapa
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario: CLLocation = locations.last!
        
        // Montar exibicao do mapa
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude
         
         let deltaLagitude: CLLocationDegrees = 0.01
         let deltaLongitude: CLLocationDegrees = 0.01
         
         let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLagitude, longitudeDelta: deltaLongitude)
         let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
         let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
         map.setRegion(region, animated: true)
    }


}

