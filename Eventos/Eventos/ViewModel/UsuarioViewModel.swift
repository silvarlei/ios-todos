//
//  UsuarioViewModel.swift
//  Eventos
//
//  Created by silvarlei soares on 01/04/22.
//

import Foundation


class UsuarioViewModel  {
    
    var del:ipessoa!
    func retorno()  {
        del.retorno()
    }
    
    
    
    private  var listUsuario :[pessoa] = []
    
    
    func QtdUsuario()
    {
        del.retorno()
    }
    
    
    func PopulaAray()->[pessoa]{
        let  _usu = pessoa()
        
        listUsuario.append( _usu)
        return listUsuario
    }
}
