//
//  ViewController.swift
//  mapa aula
//
//  Created by Juliane Lopes on 04/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    // Mapa
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
     /*   let latitude: CLLocationDegrees = -23.516252
        let longitude: CLLocationDegrees = -46.540785
        
        let deltalatitude: CLLocationDegrees = 0.01
        let deltalongitude: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake( latitude, longitude)
        let span: MKCoordinateSpan = MKCoordinateSpan( latitudeDelta: deltalatitude,  longitudeDelta: deltalongitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion( center: localizacao, span: span)
        
        mapa.setRegion( regiao, animated: true)
        
        
        // anotacao da localizacao no mapa
        
        let anotacao = MKPointAnnotation()
        
        anotacao.coordinate = localizacao
        anotacao.title = "casa"
        anotacao.subtitle = "proximo de casa"
        
        mapa.addAnnotation( anotacao)*/
    }
}
