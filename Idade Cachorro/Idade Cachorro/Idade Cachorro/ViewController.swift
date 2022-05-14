//
//  ViewController.swift
//  Idade Cachorro
//
//  Created by Juliane Lopes on 07/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var legendaResultado: UILabel!
    
    @IBOutlet weak var campoIdadeCachorro: UITextField!
    
    @IBAction func descobrirIdade(_ sender: Any) {

        let idade = Int(campoIdadeCachorro.text!)! * 7
        legendaResultado.text = "A idade do cachorro é: " + String(idade)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

