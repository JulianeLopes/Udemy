//
//  ViewController.swift
//  Cara ou Coroa
//
//  Created by Juliane Lopes on 10/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // sempre que tiver segue deve usar o prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "jogarMoedas"{
            let vcDestino = segue.destination as! DetalhesViewController
       
            vcDestino.numeroRandomico = Int(arc4random_uniform(2))
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

