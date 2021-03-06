//
//  ViewController.swift
//  Meus Filmes Aulas
//
//  Created by Juliane Lopes on 15/12/21.
//  Copyright © 2021 Udemy. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes: [Filme] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var filme: Filme
        
        filme = Filme(titulo: "Filme 1", descricao: "Descrição 1", imagem: #imageLiteral(resourceName: "filme7"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 2", descricao: "Descrição 2", imagem: #imageLiteral(resourceName: "filme2"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 3", descricao: "Descrição 3", imagem: #imageLiteral(resourceName: "filme3"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 4", descricao: "Descrição 4", imagem: #imageLiteral(resourceName: "filme4"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 5", descricao: "Descrição 5", imagem: #imageLiteral(resourceName: "filme5"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 6", descricao: "Descrição 6", imagem: #imageLiteral(resourceName: "filme6"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 7", descricao: "Descrição 7", imagem: #imageLiteral(resourceName: "filme3"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 8", descricao: "Descrição 8", imagem: #imageLiteral(resourceName: "filme8"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 9", descricao: "Descrição 9", imagem: #imageLiteral(resourceName: "filme9"))
        filmes.append (filme)
        
        filme = Filme(titulo: "Filme 10", descricao: "Descrição 10", imagem: #imageLiteral(resourceName: "filme10"))
        filmes.append (filme)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filme = filmes[indexPath.row]
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula
        celula.filmeImageView.image = filme.imagem
        celula.tituloLabel.text = filme.titulo
        celula.descricaoLabel.text = filme.descricao
        
       /* celula.filmeImageView.layer.cornerRadius = 42
        celula.filmeImageView.clipsToBounds = true */
        
        /* celula.textLabel?.text = filme.titulo
         celula.imageView?.image = filme.imagem */
        
        return celula
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "detalheFilme"{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                let filmeSelecionado = self.filmes[indexPath.row]
                let viewControllerDestino = segue.destination as! DetalhesFilmeViewController
                viewControllerDestino.filme = filmeSelecionado
            }
            
        }
    }
}


