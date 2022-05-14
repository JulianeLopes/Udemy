//
//  ViewController.swift
//  tabela-dimanica-refeicoes
//
//  Created by Juliane Lopes on 19/11/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let refeicoes = ["churros", "Macarrao", "Pizza"]

    override func viewDidLoad() {
        super.viewDidLoad()
       print("tableviewcontroller foi carregada")
    }
    

    // numero de linhas
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
        
    }
    // celula
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao
        
        return celula
    }
}

