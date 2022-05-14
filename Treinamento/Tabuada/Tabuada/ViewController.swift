//
//  ViewController.swift
//  Tabuada
//
//  Created by Juliane Lopes on 17/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var primeiroNumero: UITextField!
    @IBOutlet weak var segundoNumero: UITextField!
    @IBOutlet weak var resultado: UILabel!
    
    @IBAction func calcular(_ sender: Any) {
      let calculo = Int (primeiroNumero.text!)! * Int(segundoNumero.text!)!
        
        resultado.text = "Resultado " + String(calculo)
  }
    

}
