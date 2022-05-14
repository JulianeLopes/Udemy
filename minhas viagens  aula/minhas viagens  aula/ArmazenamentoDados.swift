//
//  ArmazenamentoDados.swift
//  minhas viagens  aula
//
//  Created by Juliane Lopes on 12/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import UIKit

class ArmazenamentoDados{
    
    let chaveArmazenamento = "locaisViagem"
    var viagens: [ Dictionary <String, String> ] = []
    
    func getDefauls() -> UserDefaults {
        return UserDefaults.standard
    }
    
    
    func salvarViagem(viagem: Dictionary <String, String> ){
        viagens = listarViagens()
        
        viagens.append(viagem)
        getDefauls().set(viagens, forKey: chaveArmazenamento)
        getDefauls().synchronize()
        
    }
    func listarViagens() -> [Dictionary <String, String>]{
        
        let dados = getDefauls().object(forKey: chaveArmazenamento)
        if dados != nil{
            return dados as! Array
        }else{
            return[]
        }
        
        
    }
    func removerViagem(indice: Int){
        
        viagens = listarViagens()
        viagens.remove(at: indice)
        
        getDefauls().set(viagens, forKey: chaveArmazenamento)
        getDefauls().synchronize()
        
    }
}
