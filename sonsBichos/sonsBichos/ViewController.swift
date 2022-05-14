//
//  ViewController.swift
//  sonsBichos
//
//  Created by Juliane Lopes on 11/03/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    
    @IBAction func cao(_ sender: Any) {
        executarSons(nomeSom: "cao")
    }
    
  //  @IBAction func gato2(_ sender: Any) {
  //      executarSons(nomeSom: "gato")
  //  }

    @IBAction func leao(_ sender: Any) {
        executarSons(nomeSom: "leao")
        }
    
    @IBAction func macaco(_ sender: Any) {
        executarSons(nomeSom: "macaco")
    }
 
    @IBAction func ovelha(_ sender: Any) {
        executarSons(nomeSom: "ovelha")
    }
  
    @IBAction func vaca(_ sender: Any) {
        executarSons(nomeSom: "vaca")
    }
    
    func executarSons(nomeSom: String){
        
        if let path = Bundle.main.path(forResource: nomeSom, ofType: "mp3"){
            let url = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                player.play()
            } catch  {
                print("Erro ao executar audio!")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

