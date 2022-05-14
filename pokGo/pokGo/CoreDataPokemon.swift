//
//  CoreDataPokemon.swift
//  pokGo
//
//  Created by Juliane Lopes on 02/03/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit
import CoreData

class CoreDataPokemon{

    // recuperar contexto
    func getContext() ->  NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        return context!
        
    }
    
    func recuperarPokemonsCapturados(capturado: Bool) -> [Pokemon] {
         let context = self.getContext()
        
        let requisicao = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
        requisicao.predicate = NSPredicate(format: "capturado = %@", capturado as CVarArg )
        
        do {
            let pokemons =  try context.fetch(requisicao) as [Pokemon]
            return pokemons
            
        } catch {}
        
        return [ ]
    }
    
    func recuperarPokemons() -> [Pokemon]{
        
        let context = self.getContext()
        
        do {
           let pokemons = try context.fetch( Pokemon.fetchRequest() ) as! [Pokemon]
            
            if pokemons.count == 0{
                self.adicionarPokemon()
                return self.recuperarPokemons()
            }
            
            return pokemons
        }catch{}
            return []
       }
    
    func salvarPokemon( pokemon: Pokemon){
        let context = self.getContext()
        pokemon.capturado = true
        
        do {
               try context.save()
           } catch  {  }    
    }
    // adicionar pokemon
   func adicionarPokemon(){
    
    let context = self.getContext()
    
    self.criarPokemon(nome: "Mew", NomeImagem: "mew", capturado: false)
    self.criarPokemon(nome: "Bellsprout", NomeImagem: "bellsprout", capturado: false)
    self.criarPokemon(nome: "Bullbasaur", NomeImagem: "bullbasaur", capturado: false)
    self.criarPokemon(nome: "Caterpie", NomeImagem: "caterpie", capturado: false)
    self.criarPokemon(nome: "Charmander", NomeImagem: "charmander", capturado: false)
    self.criarPokemon(nome: "Meowth", NomeImagem: "meowth", capturado: false)
    self.criarPokemon(nome: "Psyduck", NomeImagem: "psyduck", capturado: false)
    self.criarPokemon(nome: "Rattata", NomeImagem: "rattata", capturado: false)
    self.criarPokemon(nome: "Snorlax", NomeImagem: "snorlax", capturado: false)
    self.criarPokemon(nome: "Squirtle", NomeImagem: "squirtle", capturado: false)
    self.criarPokemon(nome: "Zubat", NomeImagem: "zubat", capturado: false)
    self.criarPokemon(nome: "Pikachu", NomeImagem: "pikachu", capturado: true)
    
    do {
        try context.save()
    } catch  {
        }     
    }
    // criar pokemon
    func criarPokemon(nome: String, NomeImagem: String, capturado: Bool){
        
        let context = self.getContext()
        let pokemon = Pokemon(context: context)
        pokemon.nome = nome
        pokemon.imagem = NomeImagem
        pokemon.capturado = capturado
    }
    
   
}
