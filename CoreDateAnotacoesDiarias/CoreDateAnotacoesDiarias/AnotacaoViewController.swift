//
//  AnotacaoViewController.swift
//  CoreDateAnotacoesDiarias
//
//  Created by Juliane Lopes on 20/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import CoreData

class AnotacaoViewController: UIViewController {
    
    @IBOutlet weak var texto: UITextView!
    var context: NSManagedObjectContext!
    var anotacao:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuracoes iniciais
        self.texto.becomeFirstResponder()
        if anotacao != nil { // atualizar
            if let textoRecuperado = anotacao.value(forKey: "texto"){
                self.texto.text = String(describing: textoRecuperado)
            }
        }else{
            self.texto.text = ""
        }
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    @IBAction func salvar(_ sender: Any) {
        
        if anotacao != nil{//atualizar
            self.atualizarAnotacao()
        } else{
            self.salvarAnotacao()
        }
        
        
        // retornar para tela principal
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    func atualizarAnotacao(){
        
        anotacao.setValue(self.texto.text, forKey: "texto")
        anotacao.setValue(Date(), forKey: "data")
        
        do {
            try context.save()
            print("Sucesso ao atualizar anotação!")
        } catch let erro {
            print("Erro ao atualizar anotação: \( erro.localizedDescription) ")
        }
        
    }
    
    func salvarAnotacao(){
            
        // cria objeto para anotacao
        let novaAnotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: context)
        
        // configura anotacao
        novaAnotacao.setValue( self.texto.text , forKey: "texto")
        novaAnotacao.setValue( Date(), forKey: "data")
        
        do {
            try context.save()
            print("Sucesso ao salvar anotação!")
        } catch let erro {
            print("Erro ao salvar anotação: \( erro.localizedDescription) ")
        }
    }
}

