//
//  MessageView.swift
//  Ichat
//
//  Created by silvarlei soares on 11/04/22.
//

import SwiftUI

struct MessageView: View {
    @StateObject var viewModel = mesageViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                
            }
            .toolbar {
                ToolbarItem(id: "Contatos", placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true) {
                    NavigationLink("Contatos" ,destination: Text("Tela de mensagem"))
                }
                ToolbarItem(id: "logout", placement: ToolbarItemPlacement.navigationBarTrailing, showsByDefault: true) {
                    Button{
                        viewModel.Logout()
                    }label: {
                        Text("Logout")
                    }
                }
            }
           
        }
        
        
        
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
