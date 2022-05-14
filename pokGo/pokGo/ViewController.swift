//
//  ViewController.swift
//  pokGo
//
//  Created by Juliane Lopes on 11/02/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import MapKit


// classe:
// 1. atributos
// 2. funçao


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var contador = 0
    var coreDataPokemon: CoreDataPokemon!
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.delegate = self
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
        // recuperar pokemons
        
        self.coreDataPokemon = CoreDataPokemon()
        self.pokemons = self.coreDataPokemon.recuperarPokemons()
        
        // exibir pokemom
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            
            //print("Exibe anotação")
            if let coordenadas = self.gerenciadorLocalizacao.location?.coordinate{
                
                let totalPokemons =  UInt32(self.pokemons.count)
                let indicePokemonAleatorio = arc4random_uniform(totalPokemons)
                
                let pokemon = self.pokemons[ Int(indicePokemonAleatorio)]
                
                
                let anotacao = PokemonAnotacao(coordenadas: coordenadas, pokemon: pokemon )
                
                let latAleatoria  = (Double(arc4random_uniform(400)) - 200) / 100000.0
                let longAleatoria = (Double(arc4random_uniform(400)) - 200) / 100000.0
                
           
                anotacao.coordinate.latitude  += latAleatoria
                anotacao.coordinate.longitude += longAleatoria
                
                self.mapa.addAnnotation( anotacao)
            }
        }
    }
    
      // centralizar usuario na tela
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if contador < 3{
            
            self.centralizar()
            contador += 1
        }else{
            gerenciadorLocalizacao.stopUpdatingLocation()
        }
    }
    
    // configurar imagem como marcador
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let anotacaoView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        if annotation is MKUserLocation{
            anotacaoView.image = #imageLiteral(resourceName: "player.png")
        } else {
            let pokemon = (annotation as! PokemonAnotacao).pokemon
            anotacaoView.image = UIImage(named: pokemon.imagem!)
        }
        
        // configurar tamanho da imagem
        
        var frame = anotacaoView.frame
        frame.size.height = 40
        frame.size.width = 40
        
        anotacaoView.frame = frame
        
        return anotacaoView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let anotacao = view.annotation
        let pokemon = (view.annotation as! PokemonAnotacao).pokemon
        
        mapView.deselectAnnotation(anotacao, animated: true)
        
        if anotacao is MKUserLocation {
            return
        }
        self.coreDataPokemon.salvarPokemon(pokemon: pokemon)
    
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse && status != .notDetermined{
            
            // alerta
            let alertController = UIAlertController(title: "Permissão para localização", message: "Para caçar Pokemon precisamos da localização ", preferredStyle: .alert)
            
            let acaoConfiguracoes = UIAlertAction(title: "abrir configurações", style: .default, handler:  { (alertaConfiguracoes) in
                
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "cancelar", style: .default, handler: nil)
            
            alertController.addAction(acaoConfiguracoes)
            alertController.addAction(acaoCancelar)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func centralizar(){
        
        if let coordenadas = gerenciadorLocalizacao.location?.coordinate{
            let regiao = MKCoordinateRegion.init(center: coordenadas, latitudinalMeters: 200, longitudinalMeters: 200)
            mapa.setRegion(regiao, animated: true)
        }
    }
    
    @IBAction func centralizarJogador(_ sender: AnyObject) {
        self.centralizar()
    }
    
    
    @IBAction func abrirPokedex(_ sender: AnyObject) {
    }
    
    
}

