//
//  ViewController.swift
//  sorteio numero aleatorio
//
//  Created by Juliane Lopes on 22/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var campoTexto: UILabel!
    
   /* @IBAction func botaoUm(_ sender: Any) {
        
        let um = arc4random_uniform(11)
        
        campoTexto.text = String(um)
        
    } */
    
    
    @IBAction func botaoDois(_ sender: Any) {
        
        let dois = arc4random_uniform(41)
        campoTexto.text = String(dois)
    }
    
    
    
    @IBAction func botaoTres(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

