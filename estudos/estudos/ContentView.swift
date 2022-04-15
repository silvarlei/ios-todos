//
//  ContentView.swift
//  estudos
//
//  Created by silvarlei soares on 27/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue,.white]),  startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                Menu()
                
                
                
            }
            .background(Color.blue)
            Spacer()
        }
    }
}

struct Principal :View{
    var body :some View{
        VStack{
            Text("Sao Paulo, SP")
                .padding(10)
                .font(.system(size: 32))
                .foregroundColor(.white)
            Text("🔆")
                .font(.system(size: (190)))
            Text("78")
                .font(.system( size: (90)))
                .foregroundColor(.white)
            
            
        }
        Spacer()
    }
}
struct Semana :View{
    var body :some View{
        HStack{
            Dias()
            Dias()
            Dias()
            Dias()
            Dias()
            Dias()
        }
        .padding(30)
        
    }
}
struct Dias :View{
    var body :some View{
        VStack{
            Text("Seg")
                .foregroundColor(.white)
            Text("🔆")
            Text("78")
                .foregroundColor(.white)
        }
    }
}
struct Menu :View{
    var body :some View{
        VStack{
            Principal()
            Semana()
            Button("Mudasr hora do dia") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            NavigationLink( destination: nav() ){
                Text("mudar de tela")
            }
            .padding(30)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
