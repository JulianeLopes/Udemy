//
//  ViewController.swift
//  Frases do Dia
//
//  Created by Juliane Lopes on 08/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var legendaResultado: UILabel!
    
    @IBAction func novaFrase(_ sender: Any) {
        
        var frases: [String] = []
        frases.append("Frase 1")
        frases.append("Frase 2")
        frases.append("Frase 3")
        
        let numeroAleatorio = arc4random_uniform(3)
        legendaResultado.text = frases[ Int (numeroAleatorio)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

