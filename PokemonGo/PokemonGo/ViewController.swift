//
//  ViewController.swift
//  PokemonGo
//
//  Created by Juliane Lopes on 09/02/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var Map: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var contador = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Map.delegate = self
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    
    // centralizar o usuario na tela
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if contador < 5{
            
            if let coordenadas = gerenciadorLocalizacao.location?.coordinate{
                let regiao = MKCoordinateRegion(center: coordenadas, latitudinalMeters: 200, longitudinalMeters: 200)
                mapa.setRegion(regiao, animated: true)
                
            }
            
            
            
            // chama sempre quando o status de autorização muda
            
            func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                if status != .authorizedWhenInUse && status != .notDetermined{
                    // alerta
                    let  alertController = UIAlertController(title: "Permissão de localização", message: "Para caçar Pokemon precisamos da localização! Por favor, habilite", preferredStyle: .alert)
                    
                    let acaoConfiguracoes = UIAlertAction(title: "abrir configurações", style: .default, handler:  { (alertaConfiguracoes) in
                        
                        if let configuracoes = NSURL(string: UIApplication.openSettingsURLString){
                            UIApplication.shared.open(configuracoes as URL)
                        }
                    })
                    
                    let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                    
                    alertController.addAction(acaoConfiguracoes)
                    alertController.addAction(acaoCancelar)
                    
                    present(alertController, animated: true, completion: nil)
                    
                    
                }
            }
            
            
}
