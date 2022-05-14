//
//  ViewController.swift
//  CoreDataProduto
//
//  Created by Juliane Lopes on 14/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Passo 1 - chamar a classe da pagina CoreDate
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
       
        
        // Passo 2 - criar e salvar dados do produto
        
        // criar dados do produto
        let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
        
        
        // configura produtos de acordo com as informacoes da aba CoreDate
        produto.setValue("laranja", forKey: "cor")
        produto.setValue("almofada", forKey: "descricao")
        produto.setValue(10.00, forKey: "preco")
        
        // salvar dados do produto
        do {
            try context.save()
            print("produto salvos")
        }catch {
            print("produto não cadastrado")
        }
     
        
        // Passo 3 - exibir as informacoes do produto
        
        // criar requisicao de dados
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        do {
            let qtProdutos = try context.fetch(requisicao)
            if qtProdutos.count > 0 {
                for produto in qtProdutos as! [NSManagedObject]{
                    let nomeProduto = produto.value(forKey: "cor")
                    print(nomeProduto)
                }
            }else{
                print("nenhum produto encontrado!")
            }
        }catch {
            print("erro!")
        }
    }
}
