//
//  ViewController.swift
//  Minhas Anotações
//
//  Created by Juliane Lopes on 15/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var anotacoes: UITextView!
    let chave = "MinhaAnotacao"
    
    @IBAction func botaoSalvar(_ sender: Any) {
        
        if let salvarAnotacao = anotacoes.text{
            UserDefaults.standard.set(salvarAnotacao , forKey: chave )
        }
    }
    func recuperarAnotacao() -> String{
        
        if let anotacaoRecuperado = UserDefaults.standard.object(forKey: chave){
            return anotacaoRecuperado as! String
        }
        return ""
    }
    
   override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        anotacoes.text = recuperarAnotacao()
    }
}

