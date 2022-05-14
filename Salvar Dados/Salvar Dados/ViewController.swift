//
//  ViewController.swift
//  Salvar Dados
//
//  Created by Juliane Lopes on 15/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // salvar dados
       UserDefaults.standard.set("azul", forKey: "corFundo")
     
        // recuperar dados
       let texto = UserDefaults.standard.object(forKey: "corFundo")
       print(texto)
        
        //var comidas: [String] = ["Lasanha", "Pizza"]
        //UserDefaults.standard.set(comidas, forKey: "comidas")
        
        // remover dados
        UserDefaults.standard.removeObject(forKey: "cor fundo")
        
        // imprimir dados
        let retorno = UserDefaults.standard.object(forKey: "comidas")
        print(retorno)
    }
}

