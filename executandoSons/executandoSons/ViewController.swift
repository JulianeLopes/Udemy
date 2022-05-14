//
//  ViewController.swift
//  executandoSons
//
//  Created by Juliane Lopes on 10/03/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBAction func atualizarVolume(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "bach", ofType: "mp3"){
            let url = URL(fileURLWithPath: path)
           
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                
                player.play()
            } catch  {
                print("Erro ao executar som!")
            }
        }
    }
}

