//
//  CorGradiente.swift
//  CorGradiente
//
//  Created by Juliane Lopes on 01/02/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func corFundo(cor1: UIColor, cor2: UIColor){
        
        let gradientLayer = CAGradientLayer()
        
        // tamanho do gradiente
        gradientLayer.frame = bounds
        // cor do gradiente (branco e amarelo)
        gradientLayer.colors = [cor1.cgColor, cor2.cgColor]
        // lugar onde começa o gradiente, varia de 0.0 e 1.0 (parte de cima e parte de baixo)
      gradientLayer.locations = [0.0, 1.0]
        //começo da cor do gradiente (esquerda e direita)
        gradientLayer.startPoint = CGPoint(x: 0.5, y:0.0)
        // final da cor
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        // inserir no objeto
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}

