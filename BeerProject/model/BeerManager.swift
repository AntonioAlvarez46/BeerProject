//
//  BeerManager.swift
//  BeerProject
//
//  Created by Antonio Álvarez de los Santos on 5/3/22.
//

import Foundation

protocol BeerManagerDelegate {
    func didUpdateBeer(_ beerManager: BeerManager, beerData: [BeerData])
    func didFailWithError(error: Error)
}

struct BeerManager {
    
    var delegate: BeerManagerDelegate?
     
    func getBeer(search: String) {
        
        var base = Constants.ws.beerBase
        let parameterFood = Constants.ws.parameterFood
        let userSearch = search.replacingOccurrences(of: Constants.nameWords.spaceWord, with: Constants.nameWords.lowBar, options: .literal, range: nil)
        
        if(userSearch != Constants.nameWords.emptyWord) {
            base += parameterFood + userSearch
        }
        
//        create the url
        if let url = URL(string: base) {
//        Creamos la session
        let session = URLSession(configuration: .default)
//        create the task
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                    
                if let safeData = data {
                    if let beers = self.parseJSON(safeData) {
                        self.delegate?.didUpdateBeer(self, beerData: beers)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [BeerData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([BeerData].self, from: data)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    } 
}
