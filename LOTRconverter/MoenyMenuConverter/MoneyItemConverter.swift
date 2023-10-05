//
//  MoneyItemConverter.swift
//  LOTRconverter
//
//  Created by Alfredo Tochon on 10/5/23.
//

import SwiftUI

struct MoneyItemConverter: View {
    
    let item: CoinItemConverter

    var body: some View {
        Image(item.image)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding(4)
            .background(.brown)
            .overlay {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(item.text)
                            .font(.caption2)
                            .padding(.bottom, 2)
                        Spacer()
                        
                    }.background(.brown.opacity(0.8))
                }
            }
            .clipShape(.rect(cornerRadius: 20.0))
            .overlay(
                item.isSelected ? RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black.opacity(0.5), lineWidth: 3)
                : nil
            )
            .shadow(radius: item.isSelected ? 9 : 0)
    }
}

#Preview {
    MoneyItemConverter(item: CoinItemConverter(image: "goldpenny", text: "Gold coin", isSelected: true))
}

struct CoinItemConverter: Identifiable {
    var id = UUID()
    let image: String
    let text: String
    let isSelected : Bool
}

//struct SampleCoinData {
//    static var data : [CoinItemConverter] = [
//        CoinItemConverter(image: .copperpenny, text: "Copper Penny", isSelected: false),
//        CoinItemConverter(image: .silverpenny, text: "Silver Penny", isSelected: false),
//        CoinItemConverter(image: .silverpiece, text: "Silver Piece", isSelected: false),
//        CoinItemConverter(image: .goldpenny, text: "Gold Penny", isSelected: false),
//        CoinItemConverter(image: .goldpiece, text: "Gold Piece", isSelected: false)
//    ]
//}
