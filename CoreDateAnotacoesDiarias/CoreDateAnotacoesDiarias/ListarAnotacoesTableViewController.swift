//
//  ListarAnotacoesTableViewController.swift
//  CoreDateAnotacoesDiarias
//
//  Created by Juliane Lopes on 20/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import CoreData

class ListarAnotacoesTableViewController: UITableViewController {
    
    var context: NSManagedObjectContext!
    var anotacoes: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool){
        self.recuperarAnotacoes()
    }
    
    func recuperarAnotacoes(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Anotacao")
        let ordenacao = NSSortDescriptor(key: "data", ascending: false)
        requisicao.sortDescriptors = [ordenacao]
        
        do {
            let anotacoesRecuperadas = try context.fetch(requisicao)
            self.anotacoes = anotacoesRecuperadas as! [NSManagedObject]
            self.tableView.reloadData()
            
        } catch let erro {
            print("Erro ao recuperar anotações: \(erro.localizedDescription) ")
        }
    }
    
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.anotacoes.count
    }
    
    // saber a linha selecionada
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let indice = indexPath.row
        let anotacao = self.anotacoes[indice]
        self.performSegue(withIdentifier: "verAnotacao", sender: anotacao)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "verAnotacao"{
            
            let viewDestino = segue.destination as! AnotacaoViewController
            viewDestino.anotacao = sender as? NSManagedObject
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        // Configure the cell...
        let anotacao = self.anotacoes[indexPath.row]
        let textoRecuperado = anotacao.value(forKey: "texto")
        let dataRecuperada  = anotacao.value(forKey: "data")
        
        //formatar data
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm "
        
        let novaData = dateFormatter.string(from: dataRecuperada as! Date)
        
        celula.textLabel?.text = textoRecuperado as? String
        celula.detailTextLabel?.text = novaData
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            let indice = indexPath.row
            let anotacao = self.anotacoes[indice]
            
            self.context.delete(anotacao)
            self.anotacoes.remove(at: indice)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do {
                try self.context.save()
            } catch _ {
                print("Erro ao remover item")
            }
            
        }
    }
}
