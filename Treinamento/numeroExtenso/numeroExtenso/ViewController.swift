//
//  ViewController.swift
//  numeroExtenso
//
//  Created by Juliane Lopes on 04/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var numero: [String] = []
    var extenso: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numero.append("1")
        numero.append("2")
        numero.append("3")
        
        extenso.append("um")
        extenso.append("dois")
        extenso.append("três")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numero.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = numero[indexPath.row]
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    let alertaController = UIAlertController(title: "Numero por Extenso", message: extenso[ indexPath.row], preferredStyle: .alert)
           let acaoConfirmar = UIAlertAction(title: "ok", style: .default, handler: nil)
           
           alertaController.addAction(acaoConfirmar)
           
           present(alertaController, animated: true, completion: nil)
    
}
   }

