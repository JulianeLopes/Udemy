//
//  ViewController.swift
//  sorteio por nome
//
//  Created by Juliane Lopes on 22/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var campoTexto: UILabel!
    
    @IBAction func Botao(_ sender: Any) {
        
        var nomes:[String] = []
        
        nomes.append("JuJu")
        nomes.append("Bonitao da JuJu")
        nomes.append("Baby Delicia")
        
        let sorteio = arc4random_uniform(3)
        campoTexto.text = nomes[Int(sorteio)]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

