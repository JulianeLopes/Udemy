//
//  refeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Juliane Lopes on 19/11/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController,
AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Comida Japosesa", felicidade: 5)]
    
    // linhas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    // celulas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    //adicionar e atualizar na celula quando fazer o botao pelas telas desenhadas - 3 passo
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
          
            // alerta com mensagem e botao de OK
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(botaoCancelar)
            present(alerta, animated: true, completion: nil)
        }
    }
    
    // ligar as telas com a seta - telas desenhadas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}

