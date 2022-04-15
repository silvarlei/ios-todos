//
//  ContentView.swift
//  UI-templates
//
//  Created by silvarlei soares on 06/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var comidavm=comidaViewModel()
    init() {
        
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue, .font: UIFont(name: "Savoye LET", size: 40)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.blue, .font: UIFont(name: "Savoye LET", size: 30)!]

        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
    } //init
    var body: some View {
        NavigationView{
            VStack{
               // Text("🍟 Cardapio")
                 //   .font(.system(size: 30))
                //    .padding()
                
                ScrollView(){
                    VStack()
                    {
                        
                        listaDeView(comidavm: comidavm.comidas)
                        
                        
                    }
                    
                }
            }
            .navigationTitle("🍟 Cardapio")
            .navigationBarTitleDisplayMode(.inline)
        }
       
        
    }
}

