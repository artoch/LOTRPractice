//
//  CurrencyInfo.swift
//  LOTRconverter
//
//  Created by Alfredo Tochon on 10/4/23.
//

import SwiftUI

struct CurrencyInfo: View {
    
    let info : ExchangeInfoValues
    
    var body: some View {
        
        HStack {
            Image(info.pieceA)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(info.text)
            
            Image(info.pieceB)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
        
    }
}

#Preview {
    CurrencyInfo(info: ExchangeInfoValues(pieceA: .goldpiece, text: "1 Gold piece = 4 Gold Pennies", pieceB: .goldpenny))
        .previewLayout(.sizeThatFits)
}


struct ExchangeInfoValues: Identifiable {
    var id = UUID()
    let pieceA: ImageResource
    let text: String
    let pieceB: ImageResource
}

struct SampleData {
    static var data : [ExchangeInfoValues] = [
        ExchangeInfoValues(pieceA: .goldpiece, text: "1 Gold piece = 4 Gold Pennies", pieceB: .goldpenny),
        ExchangeInfoValues(pieceA: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", pieceB: .silverpiece),
        ExchangeInfoValues(pieceA: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", pieceB: .silverpenny),
        ExchangeInfoValues(pieceA: .silverpenny, text: "1 Silver Penny = 100 Cooper Pennies", pieceB: .copperpenny)
    ]
}
