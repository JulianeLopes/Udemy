//
//  TarefasuserDefauls.swift
//  Lista de Tarefas
//
//  Created by Juliane Lopes on 16/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class TarefaUserDefauls {
    
    let chave = "listaTarefas"
    var tarefas: [String] = []
    
    func remover(indice: Int){
        // recuperar tarefas ja salvas
        
        tarefas = listar()
        
        tarefas.remove(at: indice)
        
         UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    
    func salvar(tarefa: String){
        
        // recuperar tarefas ja salvas
        tarefas = listar()
        
        // salvar tarefa
        tarefas.append( tarefa )
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    func listar() -> Array<String> {
        
        let dados = UserDefaults.standard.object(forKey: chave)
        
        if dados != nil{
            return dados as! Array<String>
        } else {
            return[]
        }
        
    }
    
}
