//
//  ViewController.swift
//  calculadora
//
//  Created by Juliane Lopes on 20/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var priNum: UITextField!
    @IBOutlet weak var segNum: UITextField!
    
    
    @IBOutlet weak var adicao: UITextField!
    @IBOutlet weak var subtracao: UITextField!
    @IBOutlet weak var multiplicacao: UITextField!
    @IBOutlet weak var divisao: UITextField!
    
    @IBAction func resultado(_ sender: Any) {
        let pri = Int(priNum.text!)!
        let seg = Int(segNum.text!)!
        
        let calcularAdicao = pri + seg
        adicao.text = String(calcularAdicao)
        
        let calcularSubtracao = pri - seg
        subtracao.text = String(calcularSubtracao)
        
        let calcularMultiplicacao = pri * seg
        multiplicacao.text = String(calcularMultiplicacao)
        
        if seg != 0 {
            let calcularDivisao = pri / seg
            divisao.text = String (calcularDivisao)
        } else {
            divisao.text = ""
        }
    }
  
    @IBAction func limpar(_ sender: Any) {
        priNum.text?.removeAll()
        segNum.text?.removeAll()
        adicao.text?.removeAll()
        subtracao.text?.removeAll()
        multiplicacao.text?.removeAll()
        divisao.text?.removeAll()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
