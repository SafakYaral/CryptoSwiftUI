//
//  CryptoViewModel.swift
//  CryptoUI
//
//  Created by Safak Yaral on 26.12.2024.
//

import Foundation


class CryptoListViewModel : ObservableObject{ // crypto listte herhangi bir güncelleme olduğunda kendi kendine yenileme yapar
    
    @Published var cryptoList: [CryptoViewModel] = [] // published var = youtube gibi düşün yyayın yapacağız ve değişiklikleri gözlemlicez. ve view kendini ona göre güncelleyecek.
    
    let webservice = Webservice()
    
    func downloadCryptosAsync(url: URL) async {
        do {
            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            DispatchQueue.main.async{
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        }catch{
            print(error)
        }
    }
    
    /*func downloadCryptos(url : URL){
        
        webservice.downloadCurrencies(url: url) { result in
            switch result {
            
            case .failure(let error):
                print(error)
           
            case .success(let cryptos):
                if let cryptos = cryptos{
                    DispatchQueue.main.async{
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                    
                }
            }
        }
    }*/
    
}









struct CryptoViewModel{
    
    let crypto: CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    var currencyName: String{
        crypto.currency
    }
    var currencyPrice: String{
        crypto.price
    }
    
}
