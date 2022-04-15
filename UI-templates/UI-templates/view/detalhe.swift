//
//  detalhe.swift
//  UI-templates
//
//  Created by silvarlei soares on 06/04/22.
//

import SwiftUI

struct detalhe: View {
    var detalhePrato:comida
    
    var body: some View {
        Text( detalhePrato.prato)
        Image(detalhePrato.imagemPrato).resizable().scaledToFit().padding()
        var conv =    NSDecimalNumber(decimal:  detalhePrato.valor).stringValue
        
        
        Text(  conv)
            .font(.system(size: 17))
            .foregroundColor(Color.gray)
            .multilineTextAlignment(.leading)
    }
}


