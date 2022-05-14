//
//  Filme.swift
//  Meus Filmes Aulas
//
//  Created by Juliane Lopes on 15/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class Filme{
    
    var titulo: String!
    var descricao: String!
    var imagem: UIImage!
    
    init(titulo: String, descricao: String, imagem: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = imagem
    }
}
