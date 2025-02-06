//
//  WebService.swift
//  CryptoUI
//
//  Created by Safak Yaral on 26.12.2024.
//

import Foundation

class Webservice {
    
    func downloadCurrenciesAsync(url: URL) async throws -> [CryptoCurrency] {
        
        let (data , _) = try await URLSession.shared.data(from: url)
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
        
    }
    
    /*func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoCurrency]?, DownloadError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print(error.localizedDescription)
                completion(.failure(.invalidURL))
            }
            guard let data = data ,error == nil else { // guard let sonrasındaki gelen bloğu doğru varsayar ve aynı zamanda else te ister.
                return completion(.failure(.noData))
                
            }
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            completion(.success(currencies))
            
        }.resume() // her url session da yazmamız lazım
     

    }*/
}
enum DownloadError: Error {
    case invalidURL
    case noData
    case dataParseError
}
