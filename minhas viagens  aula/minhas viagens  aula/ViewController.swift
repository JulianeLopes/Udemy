//
//  ViewController.swift
//  minhas viagens  aula
//
//  Created by Juliane Lopes on 11/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String, String > = [:]   /* chamar dicionario (aba ArmazenamentoDados)*/
    var indiceSelecionado: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let indice = indiceSelecionado{
            if indice == -1 {// adicinar
                
                configuracaoGerenciadorLocalizacao()
                
            }else{// listar
                
                exibirAnotacao( viagem: viagem)
            }
        }
        
        // reconhecer de gestos e toques na tela
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.marcar(gesture:) ))
        reconhecedorGesto.minimumPressDuration = 2
        
        mapa.addGestureRecognizer(reconhecedorGesto)
    }
    
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     
        let local = locations.last!
        
        //exibir local
        let localizacao = CLLocationCoordinate2D(latitude: local.coordinate.latitude, longitude: local.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let regiao = MKCoordinateRegion(center: localizacao, span: span)
        self.mapa.setRegion(regiao, animated: true)
    }
    
    func exibirLocal( latitude: Double, longitude: Double){
        
        //exibir local
              let localizacao = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
              let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
              
              let regiao = MKCoordinateRegion(center: localizacao, span: span)
              self.mapa.setRegion(regiao, animated: true)
    }
    
    func exibirAnotacao(viagem: Dictionary<String, String> ){
        
        // exibir anotacao com os dados do endereco
        if let localViagem = viagem["local"]{
            if let latitudeS = viagem["latitude"]{
                if let longitudeS = viagem["longitude"]{
                    if let latitude = Double(latitudeS){
                        if let longitude = Double(longitudeS){
                            
                            
                            // adiciona anotacao
                            let anotacao = MKPointAnnotation()
                            
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            
                            self.mapa.addAnnotation(anotacao)
                            
                            exibirLocal(latitude: latitude, longitude: longitude)
                        }
                    }
                }
            }
        }
    }
    
    
    @objc func marcar(gesture: UIGestureRecognizer){
        
        if gesture.state == UIGestureRecognizer.State.began{
            
            // recuperar as coordenadas do ponto selecionado
            let pontoSelecionado = gesture.location(in: self.mapa)
            let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            
            // recuperar o endereco do ponto selecionado
            var localCompleto = "Endereço não encontrado!!"
            CLGeocoder().reverseGeocodeLocation(localizacao, completionHandler:  { (local, erro) in
                
                if erro == nil {
                    if let dadosLocal = local?.first {
                        if let nome = dadosLocal.name {
                            localCompleto = nome
                        }else {
                            if let endereco = dadosLocal.thoroughfare{
                                localCompleto = endereco
                            }
                        }
                    }
                    
                    
                    // salvar dados no dispositivo
                    
                    self.viagem = ["local": localCompleto, "latitude": String(coordenadas.latitude), "longitude": String(coordenadas.longitude)]
                    ArmazenamentoDados().salvarViagem(viagem: self.viagem)
                    
                    
                    // exibir anotacao com os dados do endereco
                    
                    let anotacao = MKPointAnnotation()
                    
                    self.exibirAnotacao(viagem: self.viagem)
                }else{
                    print( erro!)
                }
            }
            )}
    }
    
    // metodo de localizacao
    func configuracaoGerenciadorLocalizacao(){
        
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    
    // autorizacao do gps
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse {
            
            let alertaController = UIAlertController(title: "Permissão de localização",
                                                     message: "Necessário permissão para acesso a localização",
                                                     preferredStyle: .alert)
            
            let acaoConfiguracao = UIAlertAction(title: "Abrir configuração",style: .default, handler:  { (alertaConfiguracao) in
                if let configuracao = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configuracao as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertaController.addAction(acaoConfiguracao)
            alertaController.addAction(acaoCancelar)
            
            present(alertaController, animated: true, completion: nil)
        }
    }
}

