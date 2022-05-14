//
//  PokeAgendaViewController.swift
//  pokGo
//
//  Created by Juliane Lopes on 04/03/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit

class PokeAgendaViewController: UIViewController {
    
    var pokemonsCapturados: [Pokemon] = []
    var pokemonsNaoCapturados: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let coreDataPokemon = CoreDataPokemon()
        
        self.pokemonsCapturados = coreDataPokemon.recuperarPokemonsCapturados(capturado: true)
        self.pokemonsNaoCapturados = coreDataPokemon.recuperarPokemonsCapturados(capturado: false)
    }
    
    
    @IBAction func voltarMapa(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
