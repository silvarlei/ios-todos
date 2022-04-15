//
//  SignViewModel.swift
//  Ichat
//
//  Created by silvarlei soares on 28/03/22.
//

import Foundation
import FirebaseAuth

class SignViewModel : ObservableObject{
    
    var email:String = ""
    var senha:String = ""
    
    @Published var formInvalid = false
    var alerttext = ""
    @Published var isLoading = false
    
    func singIn(){
        print(email)
        print (senha )
        
        isLoading = true
        Auth.auth().signIn(withEmail: self.email, password: self.senha) {
            result ,err in
            guard let user = result?.user , err == nil else {
                self.formInvalid = true
                self.alerttext = err!.localizedDescription
                print(err ?? "Ocorreu um erro ")
                self.isLoading=false
                return
            }
            print("usuario logado \(user.uid)")
            self.isLoading = false
        }
    }
}
