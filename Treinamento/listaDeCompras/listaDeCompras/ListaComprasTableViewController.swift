//
//  ListaComprasTableViewController.swift
//  listaDeCompras
//
//  Created by Juliane Lopes on 02/02/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import CoreData

// UITableViewControle - controle de exibicao de tabela - storyboard

class ListaComprasTableViewController: UITableViewController {
    
    var context: NSManagedObjectContext!
    var compra: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
  }
    override func viewDidAppear(_ animated: Bool) {
        self.recuperarCompras()
    }
    
    func recuperarCompras(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "ComprasMercado")
        let ordenacao = NSSortDescriptor(key: "item", ascending: true)
        requisicao.sortDescriptors = [ordenacao]
        
        do {
            let compraRecuperadas = try context.fetch(requisicao)
            self.compra = compraRecuperadas as! [NSManagedObject]
            self.tableView.reloadData()
            
        } catch let erro {
            print("Erro ao recuperar")
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.compra.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let indice = indexPath.row
        let compras = self.compra[indice]
        self.performSegue(withIdentifier: "verCompras", sender: compras)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verCompras"{
            
            let viewDestino = segue.destination as! ComprasViewController
            viewDestino.compras = sender as? NSManagedObject
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        // Configure the cell...
        let compras = self.compra[indexPath.row]
        let textoRecuperado = compras.value(forKey: "item")
        
        celula.textLabel?.text = textoRecuperado as? String
        
        return celula
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            let indice = indexPath.row
            let compras = self.compra[indice]
            
            self.context.delete(compras)
            self.compra.remove(at: indice)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do {
                try self.context.save()
            } catch let erro {
                print("erro ao remover item")
            }
        }
    }
}
