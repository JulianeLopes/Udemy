//
//  ViewController.swift
//  Onde estou
//
//  Created by Juliane Lopes on 10/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario = locations.last!
        
        let latitude = localizacaoUsuario.coordinate.latitude
        let longitude = localizacaoUsuario.coordinate.longitude
        
        self.latitudeLabel.text = String(latitude)
        self.longitudeLabel.text = String(longitude)
        
        if localizacaoUsuario.speed > 0 {
        velocidadeLabel.text = String(localizacaoUsuario.speed)
        }
        
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: span)
        
        map.setRegion(regiao, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) { (detalhesLocal, erro) in
            
            if erro == nil{
                
                if let dadosLocal = detalhesLocal?.first{
                    
                    var thoroughfare = ""
                    if dadosLocal.thoroughfare != nil{
                        thoroughfare = dadosLocal.thoroughfare!
                    }
                    
                    var subThoroughfare = ""
                    if dadosLocal.subThoroughfare != nil{
                        subThoroughfare = dadosLocal.subThoroughfare!
                    }
                    
                    var locality = ""
                    if dadosLocal.locality != nil{
                        locality = dadosLocal.locality!
                    }
                    
                    var subLocality = ""
                    if dadosLocal.subLocality != nil{
                        subLocality = dadosLocal.subLocality!
                    }
                    
                    var postalCode = ""
                    if dadosLocal.postalCode != nil{
                        postalCode = dadosLocal.postalCode!
                    }
                    
                    var country = ""
                    if dadosLocal.country != nil{
                        country = dadosLocal.country!
                    }
                    
                    var administrativeArea = ""
                    if dadosLocal.administrativeArea != nil{
                        administrativeArea = dadosLocal.administrativeArea!
                    }
                    
                    var subAdministrativeArea = ""
                    if dadosLocal.subAdministrativeArea != nil{
                        subAdministrativeArea = dadosLocal.subAdministrativeArea!
                    }
                    
                    self.enderecoLabel.text = thoroughfare + " - "
                                            + subThoroughfare + " - "
                                            + locality + " - "
                                            + country + " - "
                                            + postalCode
                    
                    print(
                        
                 /* endereco*/   "\n / thoroughfare:" + thoroughfare +
                 /* numero*/     "\n / subThoroughfare:" + subThoroughfare +
                 /* Cidade*/     "\n / locality:" + locality +
                 /* Bairro*/     "\n / subLocality:" + subLocality +
                 /* CEP*/        "\n / postalCode:" + postalCode +
                 /* Pais*/       "\n / country:" + country +
                 /* UF*/         "\n / administrativeArea:" + administrativeArea +
                 /* Localidade*/ "\n / subAdministrativeArea:" + subAdministrativeArea
                    )
                }
            }
        }
        
        // 1 passo - configurar autorizacao de localizacao do gps
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            
            if status != .authorizedWhenInUse{
                let alertaController = UIAlertController(title: "Permissão de localização", message: "Necessário permissão para acesso à sua localização!! Por favor, habilite.", preferredStyle: .alert)
                
                let acaoConfiguracao = UIAlertAction(title: "abrir configuração", style: .default, handler: {( alertaConfiguracao) in
                    
                    if let configuracao = NSURL(string: UIApplication.openSettingsURLString){
                        UIApplication.shared.open( configuracao as URL)
                    }
                    
                })
                
                let AcaoCancelar = UIAlertAction(title: "cancelar", style: .default, handler: nil)
                alertaController.addAction(acaoConfiguracao)
                alertaController.addAction(AcaoCancelar)
                
                present(alertaController, animated: true, completion: nil)
            }
        }
    }
}
