//
//  ViewController.swift
//  calculos
//
//  Created by Juliane Lopes on 20/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var CampoAdUm: UITextField!
    @IBOutlet weak var CampoAdDois: UITextField!
    @IBOutlet weak var AdResultado: UITextField!
    
    @IBAction func AdCalculo(_ sender: Any) {
        let calcular = Int(CampoAdUm.text!)! + Int(CampoAdDois.text!)!
        
        AdResultado.text = String(calcular)
    }
    
    
    @IBOutlet weak var campoSubUm: UITextField!
    @IBOutlet weak var campoSubDois: UITextField!
    @IBOutlet weak var Subresultado: UITextField!
    
    @IBAction func SubCalculo(_ sender: Any) {
        let calcularSub = Int(campoSubUm.text!)! - Int(campoSubDois.text!)!
        
        Subresultado.text = String(calcularSub)
    }
    
    
    @IBOutlet weak var campoMultUm: UITextField!
    @IBOutlet weak var campoMultDois: UITextField!
    @IBOutlet weak var MultResultado: UITextField!
    
    @IBAction func MultCalcular(_ sender: Any) {
        let calcularMult = Int(campoMultUm.text!)! * Int(campoMultDois.text!)!
        
        MultResultado.text = String(calcularMult)
    }
    
    
    @IBOutlet weak var campoDivUm: UITextField!
   @IBOutlet weak var campoDivDois: UITextField!
   @IBOutlet weak var DivResultado: UITextField!
    
    
    @IBAction func DivCalcular(_ sender: Any) {
        let calcularDiv = Int(campoDivUm.text!)! / Int(campoDivDois.text!)!
        
        DivResultado.text = String(calcularDiv)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

