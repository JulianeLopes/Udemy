//
//  DetalhesViewController.swift
//  Cara ou Coroa
//
//  Created by Juliane Lopes on 10/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var numeroRandomico: Int!
    
   
    @IBOutlet weak var moedaImage: UIImageView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if numeroRandomico == 0 {
            moedaImage.image = #imageLiteral(resourceName: "moeda_coroa")
        }else {
            moedaImage.image = #imageLiteral(resourceName: "moeda_coroa")
            
        }
    }
  //  celula.imageView?.image = filme.imagem

}
