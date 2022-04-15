//
//  SignUpViewModel.swift
//  Ichat
//
//  Created by silvarlei soares on 28/03/22.
//

import Foundation
import FirebaseAuth
import UIKit
import FirebaseStorage
import FirebaseFirestore



class SignUpViewModel : ObservableObject{
    
    var delegateSignUp:SignUpDelegate!
    
    @Published   var nome:String = ""
    @Published  var email:String = ""
    @Published  var senha:String = ""
    
    @Published var formInvalid = false
    var alerttext = ""
    @Published var isLoading = false
    @Published var image = UIImage()
    
    func singUp(){
        print(email)
        print (senha )
        isLoading = true
        
        if image.size.width <= 0 {
            formInvalid = true
            alerttext = "Selecione uma foto"
            return
        }
        
        Auth.auth().createUser(withEmail: self.email, password: self.senha) {
            result ,err in
            guard let user = result?.user , err == nil else {
                self.formInvalid = true
                self.alerttext = err!.localizedDescription
                print(err)
                self.isLoading=false
                return
            }
            print("usuario criado\(user.uid)")
            self.isLoading = false
            
            self.uploadFoto()
        }
    }
    func uploadFoto(){
        var filename = UUID().uuidString
        guard  let data = image.jpegData(compressionQuality:0.2)else {return}
        
        let nomeMetaData = StorageMetadata()
        nomeMetaData.contentType = "image/jpeg"
        
        var ref =  Storage.storage().reference(withPath: "/images/\(filename).jpg")
        
        ref.putData(data, metadata: nomeMetaData){
            metadata , err in
            ref.downloadURL { url, Err in
                self.isLoading = false
                
                guard let url = url else {
                    return
                }

                print("foto criada\(url)")
                
                self.createUser(photoURL: url)
             
            }
        }
    }
    
    private func createUser(photoURL:URL){
        Firestore.firestore().collection("users")
            .document()
            .setData([
                "name":nome ,
                "uuid":Auth.auth().currentUser!.uid ,
                "profileUrl":photoURL.absoluteString
            ]) {
                err in
                if err != nil{
                    print(err!.localizedDescription)
                    
                   
                }
              
            }
        
    }
    
}
