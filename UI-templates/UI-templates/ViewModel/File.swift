//
//  File.swift
//  UI-templates
//
//  Created by silvarlei soares on 06/04/22.
//

import Foundation
import SwiftUI





struct listaDeView: View {
    var comidavm:[comida] = []
    var body: some View {
        
        
        
        ForEach(0..<comidavm.count){index in
            
            
            HStack(){
                NavigationLink(destination: detalhe(detalhePrato : comidavm[index]  )) {
                    
                    
                    Image(comidavm[index].imagemPrato).resizable().scaledToFit().padding()
                    Spacer()
                    VStack(){
                        Spacer()
                        Text(comidavm[index].prato )
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        var conv =    NSDecimalNumber(decimal:  comidavm[index].valor).stringValue
                        
                        
                        Text(  conv)
                            .font(.system(size: 17))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                }
                
            }
            
            Divider()
            
        }
    }
}
