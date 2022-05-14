//
//  ViewController.swift
//  CorGradiente
//
//  Created by Juliane Lopes on 01/02/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.corFundo(cor1: cor.branco, cor2: cor.amarelo)
        
    }


}

