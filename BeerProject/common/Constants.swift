//
//  Constants.swift
//  BeerProject
//
//  Created by Antonio Álvarez de los Santos on 10/3/22.
//

import Foundation

struct Constants {
    struct nameWords {
        static let nameProject: String = "Beer Project"
        static let emptyWord: String = ""
        static let spaceWord: String = " "
        static let imgSpace: String = "%20"
        static let accompanyingFood: String = "Accompanying Food"
        static let description: String = "Description"
        static let advice: String = "Advice"
        static let space: String = "\n"
        static let lowBar: String = "_"
    }
    
    struct identifierView {
        static let beerCell: String = "beerCellIdentifier"
        static let beerDetail: String = "SBShowBeerDetailIdentifier"
    }
    
    struct ws {
        static let beerBase: String = "https://api.punkapi.com/v2/beers"
        static let parameterFood: String = "?food="
    }
}
