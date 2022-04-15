//
//  IchatApp.swift
//  Ichat
//
//  Created by silvarlei soares on 28/03/22.
//

import SwiftUI
import Firebase

@main

struct IchatApp: App {
    init(){
        FirebaseApp.configure()
    
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
