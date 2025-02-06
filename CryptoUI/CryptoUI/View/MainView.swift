//
//  ContentView.swift
//  CryptoUI
//
//  Created by Safak Yaral on 26.12.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var cryptoListViewModel: CryptoListViewModel //izlenen obje
    
    init(){
        
        self.cryptoListViewModel = CryptoListViewModel()// main view'u kullanmak istediğimiz her yerde bize artık viewmodel'ı soracak ve onu initialize etmeden
    }
    
    
    var body: some View {
        NavigationView{
            List(cryptoListViewModel.cryptoList,id:\.id) { crypto in
                VStack{
                    Text(crypto.currencyName)
                        .font(.title2)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(crypto.currencyPrice)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            
            //refresh butonu koyup gelen değerleri sürekli güncel tutabildik
            }.toolbar(content: {
                Button{
                    //Button Clicked
                    Task.init {
                        //cryptoListViewModel.cryptoList = []
                        await cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-jSONDataSet/master/crypto.json ")!)
                        
                    }
                }label: {
                    Text("Refresh")
                }
            })
            
            
            .navigationTitle(Text("Cryptos"))

        }.task {
            await cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-jSONDataSet/master/crypto.json ")!)
        }
        
        /*.onAppear{
            cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-jSONDataSet/master/crypto.json ")!)
        }*/
        
    }
}

#Preview {
    MainView()
}
