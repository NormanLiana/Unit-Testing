//
//  Unit_Testing_LabTests.swift
//  Unit-Testing-LabTests
//
//  Created by Liana Norman on 8/29/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import XCTest
@testable import Unit_Testing_Lab

class Unit_Testing_LabTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    

    // MARK: Testing for Trivia.JSON file
    
    private func getTriviaDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Trivia", ofType: "json") else {
            fatalError("couldn't find json file called Trivia.json")
        }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldn't find data in json file: \(jsonError)")
        }
    }
    
    func testResultsHasTenElements() {
        let data = getTriviaDataFromJSON()
        let trivia = Trivia.getTrivia(from: data)
        XCTAssertTrue(trivia.results.count == 10, "The array does not have ten elements")
    }
    
    private func verifyQuestionsHaveExpectedValues(index: Int, questionParam: String, correctAnswer: String, incorrectAnswer: [String]) {
        let data = getTriviaDataFromJSON()
        let trivia = Trivia.getTrivia(from: data)
        let question = trivia.results[index]
        XCTAssertEqual(question.question, questionParam)
        XCTAssertEqual(question.correctAnswer, correctAnswer)
        XCTAssertEqual(question.incorrectAnswers, incorrectAnswer)
    }
    
    func testVerifyQuestionOneHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 0, questionParam: "Who%20was%20not%20in%20the%20band%20%22The%20Smiths%22%3F", correctAnswer: "Martin%20Chambers", incorrectAnswer: [
            "Morrissey",
            "Andy%20Rourke",
            "Mike%20Joyce"
            ])
    }
    
    func testVerifyQuestionTwoHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 1, questionParam: "Which%20song%20by%20Swedish%20electronic%20musician%20Avicii%20samples%20the%20song%20%22Something%27s%20Got%20A%20Hold%20On%20Me%22%20by%20Etta%20James%3F", correctAnswer: "Levels", incorrectAnswer: [
            "Fade%20Into%20Darkness",
            "Silhouettes",
            "Seek%20Bromance"
            ])
    }
    
    func testVerifyQuestionThreeHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 2, questionParam: "Romanian%20belongs%20to%20the%20Romance%20language%20family%2C%20shared%20with%20French%2C%20Spanish%2C%20Portuguese%20and%20Italian.%20", correctAnswer: "True", incorrectAnswer: ["False"])
    }
    
    func testVerifyQuestionFourHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 3, questionParam: "What%20year%20was%20Red%20Hot%20Chill%20Pepper%27s%20album%20%22Californication%22%20released%3F", correctAnswer: "1999", incorrectAnswer: [
            "1997",
            "2000",
            "1992"
            ])
    }
    
    func testVerifyQuestionFiveHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 4, questionParam: "Toby%20Fox%27s%20%22Megalovania%22%20was%20first%20used%20where%3F", correctAnswer: "Radiation%27s%20Earthbound%20Halloween%20Hack", incorrectAnswer: [
            "Homestuck%3A%20%5BS%5D%20Wake",
            "Undertale",
            "Mother%3A%20Cognitive%20Dissonance"
            ])
    }
    
    func testVerifyQuestionSixHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 5, questionParam: "What%20is%20not%20a%20playable%20race%20in%20%22Final%20Fantasy%20XIV%3A%20A%20Realm%20Reborn%22%3F", correctAnswer: "Hume", incorrectAnswer: [
            "Miqo%27te",
            "Lalafell",
            "Roegadyn"
            ])
    }
    
    func testVerifyQuestionSevenHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 6, questionParam: "When%20was%20%22System%20Shock%22%20released%3F", correctAnswer: "1994", incorrectAnswer: [
            "1995",
            "2000",
            "1998"
            ])
    }
    
    func testVerifyQuestionEightHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 7, questionParam: "Former%20United%20States%20President%20Bill%20Clinton%20famously%20played%20which%20instrument%3F", correctAnswer: "Saxophone", incorrectAnswer: [
            "Baritone%20horn",
            "Piano",
            "Violin"
            ])
    }
    
    func testVerifyQuestionNineHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 8, questionParam: "Who%20is%20the%20main%20character%20in%20the%20video%20game%20%22Just%20Cause%203%22%3F", correctAnswer: "Rico%20Rodriguez", incorrectAnswer: [
            "Tom%20Sheldon",
            "Marcus%20Holloway",
            "Mario%20Frigo"
            ])
    }
   
    func testVerifyQuestionTenHasExpectedValues() {
        verifyQuestionsHaveExpectedValues(index: 9, questionParam: "In%20%22Magic%3A%20The%20Gathering%22%2C%20during%20the%20design%20for%20Planar%20Chaos%2C%20what%20color%20did%20the%20developers%20think%20of%20adding%20in%20as%20the%20sixth%20color%3F", correctAnswer: "Purple", incorrectAnswer: [
            "Brown",
            "Pink",
            "Orange"
            ])
    }

    // Mark: Testing for StarWars.JSON file
    
    private func getStarWarsDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Star", ofType: "json") else {
            fatalError("couldn't find json file called StarWars.json")
        }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldn't find data in json file: \(jsonError)")
        }
    }
    
    
    
}
