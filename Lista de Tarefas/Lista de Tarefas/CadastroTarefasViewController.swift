//
//  CadastroTarefasViewController.swift
//  Lista de Tarefas
//
//  Created by Juliane Lopes on 16/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class CadastroTarefasViewController: UIViewController {

    @IBOutlet weak var tarefaCampo: UITextField!
    @IBAction func AdicionarTarefa(_ sender: Any) {
        
        if let textoDigitado = tarefaCampo.text{
         
            let tarefa = TarefaUserDefauls()
            tarefa.salvar(tarefa: textoDigitado)
            tarefaCampo.text = ""
            
            let dados = tarefa.listar()
            
            print( dados)
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
