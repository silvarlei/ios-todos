//
//  comida.swift
//  UI-templates
//
//  Created by silvarlei soares on 06/04/22.
//

import Foundation
import UIKit

struct comida:Codable {
    
    var id:Int = 0
    var prato:String = ""
    var valor:Decimal = 0
    var imagemPrato :String = ""
    
    init( id:Int ,  prato:String ,
     valor:Decimal ,
     imagemPrato :String)  {
        self.id = id
        self.prato = prato
        self.valor = valor
        self.imagemPrato = imagemPrato
    }
    
    func todosPratos()->[comida]{
        
        var listaComida:[comida]!
        
        var comidinha:comida!
        comidinha.prato = "Asian food"
        comidinha.valor = 10.00
        comidinha.imagemPrato = "guitar"
        
        listaComida.append(comidinha)
        
        
        var comidinha2:comida!
        comidinha2.prato = "japoneza food"
        comidinha2.valor = 5.00
        comidinha2.imagemPrato = "guitar"
        
        listaComida.append(comidinha2)
       
        return listaComida
        
    }
    
}
