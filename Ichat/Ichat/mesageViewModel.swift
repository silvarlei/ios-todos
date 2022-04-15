//
//  mesageViewModel.swift
//  Ichat
//
//  Created by silvarlei soares on 11/04/22.
//

import Foundation

import FirebaseAuth

class mesageViewModel : ObservableObject{
    
    func Logout(){
        try? Auth.auth().signOut()
    }
}
