//
//  StarWarsMod.swift
//  Unit-Testing-Lab
//
//  Created by Liana Norman on 9/2/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct StarWars: Codable {
    let results: [Movies]
    
    static func getMovies(from data: Data) -> StarWars {
        do {
            let newStarWars = try JSONDecoder().decode(StarWars.self, from: data)
            return newStarWars
        } catch {
            fatalError("could not decode info \(error)")
        }
    }
}

struct Movies: Codable {
    let movieTitle: String
    let movieDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case movieTitle = "title"
        case movieDescription = "opening_crawl"
    }
}
