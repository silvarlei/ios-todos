//
//  ContentView.swift
//  Ichat
//
//  Created by silvarlei soares on 11/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewmodel = ContentViewModel()
    
    var body: some View {
        ZStack{
            if viewmodel.isLogged {
                MessageView()
            }else{
                SignInView()
            }
        }.onAppear {
            viewmodel.OnAppear()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
