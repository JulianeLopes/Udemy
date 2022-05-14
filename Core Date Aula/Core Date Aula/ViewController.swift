//
//  ViewController.swift
//  Core Date Aula
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
      produto.setValue("preto", forKey: "cor")
        produto.setValue("computador", forKey: "descricao")
        produto.setValue(0.76, forKey: "preco")
        
        // salvar dados do produto
        do {
            try context.save()
            print("produto salvos")
        }catch {
            print("produto não cadastrado")
        }
        
        
        // Passo 3 - exibir as informacoes do produto
        
        // criar requisicao de dados e ordenar em ascendente ou descendente
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        // ordenar de A-Z ou Z-A
        
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
       // let ordenacaoZA = NSSortDescriptor(key: "preco", ascending: false)
        
        // aplicar filtros
        
        //let predicate = NSPredicate(format: "descricao == %@", "mesa") // localiza apenas para escrita certinho
        //let predicate = NSPredicate(format: "descricao contains [c] %@", "Mesa") //localiza com letras maiusculas e minusculas
        //let predicate = NSPredicate(format: "descricao beginswith [c] %@", "mesa") // localiza apenas pelo comeco da palavra
        
        //let predicate = NSPredicate(format: "preco == %@", "10.00") // localiza o valor dado
        //let predicate = NSPredicate(format: "preco <> %@", "10.00") // localiza o valor diferente do que foi dado
        //let predicate = NSPredicate(format: "preco => %@", "10.00") // localiza o valor igual ou maior do que foi dado
        //let predicate = NSPredicate(format: "preco =< %@", "10.00") // localiza o valor menor ou igual do que foi dado
        
        //requisicao.sortDescriptors = [ordenacaoAZ]
        //requisicao.sortDescriptors = [ordenacaoAZ, ordenacaoZA]
        //requisicao.predicate = predicate
        
        
        //OU combinacao de filtros
       // let filtroDescricao = NSPredicate(format: "descricao == %@", "mesa")
       // let filtroPreco = NSPredicate(format: "preco => %@", "100.76")
        
       // let combinacaoFiltros = NSCompoundPredicate(andPredicateWithSubpredicates: [filtroDescricao, filtroPreco]) // localiza as duas informacoes
       // let combinacaoFiltros = NSCompoundPredicate(orPredicateWithSubpredicates: [filtroDescricao, filtroPreco]) // localiza uma informacao ou a outra
        
      //  requisicao.sortDescriptors = [ordenacaoAZ]
      //  requisicao.predicate = combinacaoFiltros
        
        
           let predicate = NSPredicate(format: "preco <= %@", "60.00")
        
          requisicao.sortDescriptors = [ordenacaoAZ]
          requisicao.predicate = predicate
        
        // criar
        do {
            let qtProdutos = try context.fetch(requisicao)
            
            if qtProdutos.count > 0 {
                
                for produto in qtProdutos as! [NSManagedObject]{
                    
                    if let cor = produto.value(forKey: "cor"){
                        if let descricao = produto.value(forKey: "descricao"){
                            if let preco = produto.value(forKey: "preco"){
                               
                                print( String(describing: descricao) + "/" + String(describing: cor) + "/" + String(describing: preco))
                                
                                // remover produto
                                context.delete(produto)
                                do {
                                    try context.save()
                                    print("sucesso ao remover")
                                } catch  {
                                    print("erro ao remover")
                                }
                                
                                // atualizar caracteristicas do produto
                                
                               /* produto.setValue(120.50, forKey: "preco")
                                produto.setValue("mesa jantar", forKey: "descricao")
                                produto.setValue("rosa", forKey: "cor")
                                
                                do {
                                    try context.save()
                                    print("sucesso ao atualizar produto")
                                } catch  {
                                    print("erro ao atualizar produto")
                                }*/
                            }
                        }
                    }
                }
                
            }else{
                print("nenhum produto encontrado!")
            }
        }catch {
            print("erro!")
        }
    }
}
