//
//  JokesMod.swift
//  Unit-Testing-Lab
//
//  Created by Liana Norman on 9/2/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct Jokes: Codable {
    let setup: String
    let punchline: String
    
    static func getJokes(from data: Data) -> [Jokes] {
        do {
            let newJokes = try JSONDecoder().decode([Jokes].self, from: data)
            return newJokes
        } catch {
            fatalError("could not decode info \(error)")
        }
    }
}


