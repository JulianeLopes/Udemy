//
//  ViewController.swift
//  Signos Aula
//
//  Created by Juliane Lopes on 14/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var signos:[String] = []
    var significadoSignos:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configura signos
        signos.append("Áries")
        signos.append("Touro")
        signos.append("Gêmeos")
        signos.append("Câncer")
        signos.append("Leão")
        signos.append("Virgem")
        signos.append("Libra")
        signos.append("Escorpião")
        signos.append("Sagitário")
        signos.append("Capricórnio")
        signos.append("Aquário")
        signos.append("Peixes")
        
        // configura significados
        
        significadoSignos.append("1")
        significadoSignos.append("2")
        significadoSignos.append("3")
        significadoSignos.append("4")
        significadoSignos.append("5")
        significadoSignos.append("6")
        significadoSignos.append("7")
        significadoSignos.append("8")
        significadoSignos.append("9")
        significadoSignos.append("10")
        significadoSignos.append("11")
        significadoSignos.append("12")
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = signos[indexPath.row]
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alertaController = UIAlertController(title: "Significado do Signo", message: significadoSignos[ indexPath.row], preferredStyle: .alert)
        let acaoConfirmar = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
        
        present(alertaController, animated: true, completion: nil)
        
        // print( significadoSignos[(indexPath.row)]
    }
    }


