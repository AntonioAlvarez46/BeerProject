//
//  BeerData.swift
//  BeerProject
//
//  Created by Antonio Álvarez de los Santos on 5/3/22.
//

import Foundation

struct BeerData: Codable {
    let id: Int?
    let name: String?
    let tagline: String?
    let first_brewed: String?
    let description: String?
    let image_url: String?
    let food_pairing: [String]?
    let brewers_tips: String?
    let contributed_by: String?
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case tagline = "tagline"
            case first_brewed = "first_brewed"
            case description = "description"
            case image_url = "image_url"
            case food_pairing = "food_pairing"
            case brewers_tips = "brewers_tips"
            case contributed_by = "contributed_by"
        }
}

