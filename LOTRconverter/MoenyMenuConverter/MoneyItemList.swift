//
//  MoneyItemList.swift
//  LOTRconverter
//
//  Created by Alfredo Tochon on 10/5/23.
//

import SwiftUI

enum Psition {
    case top
    case bot
}

struct MoneyItemList: View {
    

    
    @AppStorage("leftCurrency") var storageLeft: Int = 2
    @AppStorage("rightAmount")  var storageRight: Int = 4
    
    @Binding var currency: Currency
    
    let position: Psition
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem(),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10, content: {
            ForEach(0..<5) { i in
                
                MoneyItemConverter(item: CoinItemConverter(image: CurrencyImage.allCases[i].rawValue, text: CurrencyText.allCases[i].rawValue, isSelected: currency.rawValue == Currency.allCases[i].rawValue))
                    .onTapGesture {
                        switch position {
                            case .top:
                                storageLeft = i
                            case .bot:
                                storageRight = i
                        }
                        currency = Currency.allCases[i]
                    }
            }
        })
    }
}

#Preview {
    MoneyItemList(currency: .constant(.copperPenny), position: .top)
}
