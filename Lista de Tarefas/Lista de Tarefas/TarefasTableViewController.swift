//
//  TarefasTableViewController.swift
//  Lista de Tarefas
//
//  Created by Juliane Lopes on 16/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {
    
    var tarefas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        // opcao de deletar a linha
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
            
            if editingStyle == UITableViewCell.EditingStyle.delete{
                let tarefa = TarefaUserDefauls()
                tarefa.remover(indice: indexPath.row)
                atualizarListaTarefas()
            }
        }
    
    func atualizarListaTarefas(){
        let tarefa = TarefaUserDefauls()
        tarefas = tarefa.listar()
        tableView.reloadData()
        
    }
    
    // aparecer na outra tela
    override func viewDidAppear (_ animated: Bool){
      atualizarListaTarefas()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tarefas.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        celula.textLabel?.text =  tarefas[ indexPath.row ]
        
        return celula
    }
}
    


