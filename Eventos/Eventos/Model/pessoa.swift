//
//  usuario.swift
//  Eventos
//
//  Created by silvarlei soares on 01/04/22.
//

import Foundation

protocol ipessoa{
    
    func retorno()
}

class pessoa:ObservableObject {
    
    
    var nome:String = ""
    var idade:Int = 0
    
    init()
    {
        self.nome = "silva"
        self.idade = 30
      
    }
    
 
}
