//
//  TriviaMod.swift
//  Unit-Testing-Lab
//
//  Created by Liana Norman on 8/29/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct Trivia: Codable {
    let results: [Questions]
    
    static func getTrivia(from data: Data) -> Trivia {
        do {
            let newTrivia = try JSONDecoder().decode(Trivia.self, from: data)
            return newTrivia
        } catch {
            fatalError("could not decode info \(error)")
        }
    }
    
}

struct Questions: Codable {
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    private enum CodingKeys: String, CodingKey {
        case question = "question"
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}


