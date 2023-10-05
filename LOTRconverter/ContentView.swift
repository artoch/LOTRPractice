//
//  ContentView.swift
//  LOTRconverter
//
//  Created by Alfredo Tochon on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("leftCurrency") var storageLeft: Int = 2
    @AppStorage("rightAmount")  var storageRight: Int = 4
    
    @State var leftAmount = ""
    @State var rightAmount = ""

    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    
    @State var leftTyping = false
    @State var rightTyping = false

    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @State var showSelectCurrency = false
    @State var showCurrencyInfo = false
    
    
    var body: some View {
        ZStack { //background
            
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                

                //princing image
                HStack {
                    
                    
                    
                    VStack {
                        HStack {
                            
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            MoneyMenuConverter(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            leftTyping = $0
                            leftAmountTemp = leftAmount
                        })
                        .padding(7)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(.rect(cornerRadius: CGFloat(7)))
                        .keyboardType(.decimalPad)
                        .onChange(of: leftTyping ? leftAmount : leftAmountTemp) {
                            rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                        }
                        .onChange(of: leftCurrency) {
                            leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                        }
                        .onAppear(perform: {
                            leftCurrency = Currency.allCases[storageLeft]
                        })
                        

                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        
                    
                    //MID
                    
                    VStack {
                        HStack {
                            
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            MoneyMenuConverter(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        
                        TextField("Amount", text: $rightAmount, onEditingChanged: {
                            rightTyping = $0
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .clipShape(.rect(cornerRadius: CGFloat(7)))
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp) {
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) {
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onAppear(perform: {
                                rightCurrency = Currency.allCases[storageRight]
                            })
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                HStack {
                    
                    Spacer()
                    Button {
                        showCurrencyInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showCurrencyInfo, content: {
                        ExchangeInfo()
                    })
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
