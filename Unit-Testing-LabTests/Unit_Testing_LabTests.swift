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

    // MARK: Testing Suite for StarWars.json file
    
    private func getStarWarsDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "StarWars", ofType: "json") else {
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
    
    func testResultsHasSevenElements() {
        let data = getStarWarsDataFromJSON()
        let trivia = StarWars.getMovies(from: data)
        XCTAssertTrue(trivia.results.count == 7, "The array does not have seven elements")
    }
    
    private func verifyMoviesHaveExpectedValues(index: Int, title: String, description: String) {
        let data = getStarWarsDataFromJSON()
        let movies = StarWars.getMovies(from: data)
        let movie = movies.results[index]
        XCTAssertEqual(movie.movieTitle, title)
        XCTAssertEqual(movie.movieDescription, description)
    }
    
    func testVerifyFirstMovieHasExpectedValues() {
        verifyMoviesHaveExpectedValues(index: 0, title: "A New Hope", description: "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....")
    }
    
    func testVerifySecondMovieHasExpectedValues() {
        verifyMoviesHaveExpectedValues(index: 1, title: "Attack of the Clones", description: "There is unrest in the Galactic\r\nSenate. Several thousand solar\r\nsystems have declared their\r\nintentions to leave the Republic.\r\n\r\nThis separatist movement,\r\nunder the leadership of the\r\nmysterious Count Dooku, has\r\nmade it difficult for the limited\r\nnumber of Jedi Knights to maintain \r\npeace and order in the galaxy.\r\n\r\nSenator Amidala, the former\r\nQueen of Naboo, is returning\r\nto the Galactic Senate to vote\r\non the critical issue of creating\r\nan ARMY OF THE REPUBLIC\r\nto assist the overwhelmed\r\nJedi....")
    }
    
    func testVerifyThirdMovieHasExpectedValues() {
        verifyMoviesHaveExpectedValues(index: 2, title: "The Phantom Menace", description: "Turmoil has engulfed the\r\nGalactic Republic. The taxation\r\nof trade routes to outlying star\r\nsystems is in dispute.\r\n\r\nHoping to resolve the matter\r\nwith a blockade of deadly\r\nbattleships, the greedy Trade\r\nFederation has stopped all\r\nshipping to the small planet\r\nof Naboo.\r\n\r\nWhile the Congress of the\r\nRepublic endlessly debates\r\nthis alarming chain of events,\r\nthe Supreme Chancellor has\r\nsecretly dispatched two Jedi\r\nKnights, the guardians of\r\npeace and justice in the\r\ngalaxy, to settle the conflict....")
    }
    
    func testVerifyFourthMovieHasExpectedValues() {
        verifyMoviesHaveExpectedValues(index: 3, title: "Revenge of the Sith", description: "War! The Republic is crumbling\r\nunder attacks by the ruthless\r\nSith Lord, Count Dooku.\r\nThere are heroes on both sides.\r\nEvil is everywhere.\r\n\r\nIn a stunning move, the\r\nfiendish droid leader, General\r\nGrievous, has swept into the\r\nRepublic capital and kidnapped\r\nChancellor Palpatine, leader of\r\nthe Galactic Senate.\r\n\r\nAs the Separatist Droid Army\r\nattempts to flee the besieged\r\ncapital with their valuable\r\nhostage, two Jedi Knights lead a\r\ndesperate mission to rescue the\r\ncaptive Chancellor....")
    }
    
    func testVerifyFifthMovieHasExpectedValues() {
        verifyMoviesHaveExpectedValues(index: 4, title: "Return of the Jedi", description: "Luke Skywalker has returned to\r\nhis home planet of Tatooine in\r\nan attempt to rescue his\r\nfriend Han Solo from the\r\nclutches of the vile gangster\r\nJabba the Hutt.\r\n\r\nLittle does Luke know that the\r\nGALACTIC EMPIRE has secretly\r\nbegun construction on a new\r\narmored space station even\r\nmore powerful than the first\r\ndreaded Death Star.\r\n\r\nWhen completed, this ultimate\r\nweapon will spell certain doom\r\nfor the small band of rebels\r\nstruggling to restore freedom\r\nto the galaxy...")
    }
    
    func testVerifySixthMovieHasExpectedValues() {
        verifyMoviesHaveExpectedValues(index: 5, title: "The Empire Strikes Back", description: "It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....")
    }
    
    func testVerifySeventhMovieHasExpectedValues() {
        verifyMoviesHaveExpectedValues(index: 6, title: "The Force Awakens", description: "Luke Skywalker has vanished.\r\nIn his absence, the sinister\r\nFIRST ORDER has risen from\r\nthe ashes of the Empire\r\nand will not rest until\r\nSkywalker, the last Jedi,\r\nhas been destroyed.\r\n \r\nWith the support of the\r\nREPUBLIC, General Leia Organa\r\nleads a brave RESISTANCE.\r\nShe is desperate to find her\r\nbrother Luke and gain his\r\nhelp in restoring peace and\r\njustice to the galaxy.\r\n \r\nLeia has sent her most daring\r\npilot on a secret mission\r\nto Jakku, where an old ally\r\nhas discovered a clue to\r\nLuke's whereabouts....")
    }
    
    // MARK: Testing suite for Jokes.json file
    
    private func getJokesDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Jokes", ofType: "json") else {
            fatalError("couldn't find json file called Jokes.json")
        }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldn't find data in json file: \(jsonError)")
        }
    }
    
    func testJokesArrayHasTenElements() {
        let data = getJokesDataFromJSON()
        let joke = JokesArray.getJokes(from: data)
        XCTAssertTrue(joke.count == 10, "The array does not have ten elements")
    }
    
    
//    index: Int, setup: String, punchline: String
    
//    func testVerifyJokesHaveExpectedValues() {
//        let data = getTriviaDataFromJSON()
//        let jokes = JokesArray.getJokes(from: data)
//        let joke = jokes[0]
//        XCTAssertEqual(joke.setup, "Why do C# and Java developers keep breaking their keyboards?")
//        XCTAssertEqual(joke.punchline, "Because they use a strongly typed language.")
//
//    }
    
//    func testVerifyFirstJokeHasExpectedValues() {
//
//    }
    
}
