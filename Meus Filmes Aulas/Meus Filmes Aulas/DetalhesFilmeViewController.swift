//
//  DetalhesFilmeViewController.swift
//  Meus Filmes Aulas
//
//  Created by Juliane Lopes on 15/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class DetalhesFilmeViewController: UIViewController{
    
    
    @IBOutlet weak var filmeImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    var filme: Filme!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmeImageView.image = filme.imagem
        tituloLabel.text = filme.titulo
        descricaoLabel.text = filme.descricao
    }
}
