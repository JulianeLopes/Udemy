//
//  ViewController.swift
//  nomes
//
//  Created by Juliane Lopes on 22/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var campoNome: UITextField!
    
    @IBOutlet weak var campoSobrenome: UITextField!
    
    @IBOutlet weak var campoNomeCompleto: UITextField!
    
    @IBAction func juntar(_ sender: Any) {
        let nome = campoNome.text! + " " + campoSobrenome.text!
        campoNomeCompleto.text = nome
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

