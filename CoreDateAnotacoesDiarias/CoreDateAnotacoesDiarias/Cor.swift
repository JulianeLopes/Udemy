//
//  Cor.swift
//  CoreDateAnotacoesDiarias
//
//  Created by Juliane Lopes on 31/01/22.
//  Copyright © 2022 Udemy. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func gradiente(primeiraCor: UIColor, segundaCor: UIColor){
        let cor = CAGradientLayer()
        cor.frame = bounds
        cor.colors = [primeiraCor.cgColor, segundaCor.cgColor]
        cor.locations = [0.4, 1.0]
        cor.startPoint = CGPoint(x: 0.5, y: 1.0)
        cor.endPoint = CGPoint(x: 0.5, y: 0.0)
        
        layer.insertSublayer(cor, at: 0)
    }
}
