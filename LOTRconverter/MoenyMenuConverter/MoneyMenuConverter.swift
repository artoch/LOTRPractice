//
//  MoneyMenuConverter.swift
//  LOTRconverter
//
//  Created by Alfredo Tochon on 10/5/23.
//

import SwiftUI

struct MoneyMenuConverter: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                    .bold()
                    .multilineTextAlignment(.center)
                
                MoneyItemList(currency: $leftCurrency, position: .top)

                Text("Select the currency would like to convert to:")
                    .bold()
                    .multilineTextAlignment(.center)
             
                MoneyItemList(currency: $rightCurrency, position: .bot)
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(6)
                .background(.brown)
                .clipShape(.rect(cornerRadius: CGFloat(8)))
                .padding(12)
            }
            .padding(16)
        }
    }
}

#Preview {
    MoneyMenuConverter(leftCurrency: .constant(.silverPenny), rightCurrency: .constant(.goldPenny))
}
