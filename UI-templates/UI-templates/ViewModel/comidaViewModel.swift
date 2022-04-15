//
//  comidaViewModel.swift
//  UI-templates
//
//  Created by silvarlei soares on 06/04/22.
//

import Foundation


class comidaViewModel:ObservableObject{
    
    @Published var comidas:[comida]
    
    init()
    {
        var listaComida:[comida] = []
      
        
        listaComida.append(comida(id: 1, prato:  "japoneza food", valor: 10, imagemPrato: "arabe"))
        listaComida.append(comida(id: 2,prato:  "american food", valor: 340, imagemPrato: "file"))
        listaComida.append(comida(id: 3,prato:  "chineze food", valor: 560, imagemPrato: "frutas"))
        listaComida.append(comida(id: 4, prato:  "japoneza food", valor: 10, imagemPrato: "hamburg"))
        listaComida.append(comida(id: 5 ,prato:  "japoneza food", valor: 10, imagemPrato: "file"))
        listaComida.append(comida(id: 6 , prato:  "japoneza food", valor: 10, imagemPrato: "arabe"))
        
        
      
        comidas = listaComida
    }
    
   
    
}
