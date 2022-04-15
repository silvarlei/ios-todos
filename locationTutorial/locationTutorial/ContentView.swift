//
//  ContentView.swift
//  locationTutorial
//
//  Created by silvarlei soares on 11/04/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var coreLocationDelegate:CorelocationDelegate
    @State var mode = MapUserTrackingMode.follow
    
    var body: some View {
        Map(coordinateRegion: $coreLocationDelegate.coreRegion, interactionModes: .all, showsUserLocation: true, userTrackingMode: $mode)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreLocationDelegate: CorelocationDelegate())
    }
}
