//
//  AnimeManager.swift
//  AnimeQuoteGenerator
//
//  Created by Hassane Sidibe on 3/28/23.
//

import Foundation

protocol AnimeManagerDelegate {
    func didUpdateAnime(_ animeManager: AnimeManager, quoteData: QuoteData)
}



struct AnimeManager {
    let animeUrlString = "https://animechan.vercel.app/api/random"
    var delegate: AnimeManagerDelegate?
    
    func generateAnime() {
        fetchAnime(url: animeUrlString)
    }
    
    func fetchAnime(url animeUrl: String) {
        let url = URL(string: animeUrl)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
            } else {
                
                if let safeData = data {
                    if let quoteData = parseJSON(data: safeData) {
                        //call delegate method here
                        delegate?.didUpdateAnime(self, quoteData: quoteData)
                    }
                }
                
            }
        }
        task.resume()
    }
    
    
    func parseJSON(data: Data) -> QuoteData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(QuoteData.self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}











