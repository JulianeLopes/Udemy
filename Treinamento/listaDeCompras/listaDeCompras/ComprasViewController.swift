
//  ComprasViewController.swift
//  listaDeCompras
//
//  Created by Juliane Lopes on 04/02/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import CoreData

class ComprasViewController: UIViewController {
    
    @IBOutlet weak var texto: UITextView!
    var context: NSManagedObjectContext!
    var compras: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuracao inicial - habilitar o campo de texto para ADICIONAR PRODUTO
        // chamar classe. outlet texto criado .comando primeiro a responder
        self.texto.becomeFirstResponder()
        
        if compras != nil {
            if let compraRecuperado = compras.value(forKey: "item"){
                self.texto.text = String(describing: compraRecuperado)
            }
        }else{
            self.texto.text = ""
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func salvar(_ sender: Any) {
        
        if compras != nil{
            self.atualizarLista()
        }else {
            self.salvarLista()
        }
        
        // retornar na tela principal
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    func atualizarLista(){
        
        compras.setValue(self.texto.text, forKey: "item")
        
        do {
            try context.save()
            print("Item atualizado")
        } catch let erro {
            print("Item não atualizado")
        }
    }
    
    func salvarLista(){
        
        // cria item para lista
        let novaLista = NSEntityDescription.insertNewObject(forEntityName: "ComprasMercado", into: context)
        
        // configura item na lista
        novaLista.setValue(self.texto.text, forKey: "item")
        
        do {
            try context.save()
            print("Item salvo")
        } catch let erro {
            print("Erro ao salvar")
            
        }
    }
}

