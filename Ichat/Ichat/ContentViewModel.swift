//
//  ContentViewModel.swift
//  Ichat
//
//  Created by silvarlei soares on 11/04/22.
//

import Foundation
import FirebaseAuth


class ContentViewModel:ObservableObject{
    @Published var isLogged  = Auth.auth().currentUser != nil
    
    func OnAppear()
    {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLogged = user != nil
        }
    }
}
