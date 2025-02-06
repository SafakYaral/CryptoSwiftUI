//
//  CryptoCurrency.swift
//  CryptoUI
//
//  Created by Safak Yaral on 26.12.2024.
//

import Foundation

struct CryptoCurrency : Hashable, Decodable, Identifiable {
    
    var id = UUID()
    let currency: String
    let price: String
    
    
    private enum CodableKeys : String, CodingKey { //coding key bir protocol ve bunu uyguluyoruz. web ten gelecek olan anahtar kelimeleri id ile machleyip kullanıcıya gösterir.
    
        case currency = "currency"
        case price = "price"
    }
    
}
