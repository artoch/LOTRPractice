//
//  ExchangeInfo.swift
//  LOTRconverter
//
//  Created by Alfredo Tochon on 10/4/23.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                
                Text("Exchange Rates")
                    .font(.largeTitle)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                    .padding()

                ForEach(SampleData.data) { data in
                    CurrencyInfo(info: data)
                }
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(6)
                .background(.brown)
                .clipShape(.rect(cornerRadius: CGFloat(8)))
                
            }
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    ExchangeInfo()
        .preferredColorScheme(.dark)
}
