//: Playground - noun: a place where people can play

import Foundation

// Tic Tac Tie Game Data Structure and Functions

// Core data structure: Variable length String with eight comma delimied substrings

// Substring 0: width
let widthIndex = 0
// Substring 1: height
let heightIndex = 1
// Substring 2: nought wins
let noughtWinsIndex = 2
// Substring 3: cross wins
let crossWinsIndex = 3
// Substring 4: ties
let tiesIndex = 4
// Substring 5: nought mark
let noughtMarkIndex = 5
// Substring 6: cross mark
let crossMarkIndex = 6
// Substring 7: gameboard
let gameboardIndex = 7

let subStringCount = 8

// Tic Tac Tie Game Symbols

// 0: untouched
let untouchedSymbol = "0"
// 1: nought position
let noughtPositionSymbol = "1"
// 2: cross position
let crossPositionSymbol = "2"


func newTicTacToeGame(width: Int, height: Int) -> String {
    
    let length =  width * height
    let gameboard = String(repeating: untouchedSymbol, count: length)
    let noughtWins = 0
    let crossWins = 0
    let ties = 0
    let noughtMark = "⭕️"
    let crossMark = "❌"
    
    return "\(height),\(width),\(noughtWins),\(crossWins),\(ties),\(noughtMark),\(crossMark),\(gameboard)"
}

func validateTicTacToeGame(game: String) -> Bool {
    
    let gameArray = game.components(separatedBy: ",")
    
    // game should have 8 substrings
    if gameArray.count != subStringCount {
        return false
    }
    // Width, height, nought wins, cross wins, and ties should be parsible Ints
    
    if
        let width = Int(getTicTacToeGameSubstringByIndex(game: game, index: widthIndex)),
        let height = Int(getTicTacToeGameSubstringByIndex(game: game, index: heightIndex)),
        let _ = Int(getTicTacToeGameSubstringByIndex(game: game, index: noughtWinsIndex)),
        let _ = Int(getTicTacToeGameSubstringByIndex(game: game, index: crossWinsIndex)),
        let _ = Int(getTicTacToeGameSubstringByIndex(game: game, index: tiesIndex)) {
        
        // gameboard length should equal widht * height
        let length =  width * height
        let gameboard = getTicTacToeGameSubstringByIndex(game: game, index: gameboardIndex)
        
        if gameboard.characters.count != length {
            return false
        }
    } else {
        return false
    }
    
    return true
}

func randomTicTacToeGame(width: Int, height: Int) -> String {
    let length =  width * height
    let gameboard = String(repeating: untouchedSymbol, count: length)
    let noughtWins = Int(arc4random_uniform(100))
    let crossWins = Int(arc4random_uniform(100))
    let ties = Int(arc4random_uniform(100))
    let markList = ["⭕️","🚂","🐢","🕒","🤖","😀","💯"]
    let noughtMark = markList[Int(arc4random_uniform(UInt32(markList.count)))]
    let crossMark = markList[Int(arc4random_uniform(UInt32(markList.count)))]
    
    var randomGameboard = ""
    for _ in 0..<gameboard.characters.count {
        let coinFlip = (arc4random_uniform(2) == 0)
        let mark = coinFlip ? noughtMark : crossMark
        randomGameboard.append(mark)
    }
    
    return "\(height),\(width),\(noughtWins),\(crossWins),\(ties),\(noughtMark),\(crossMark),\(randomGameboard)"
}

func getTicTacToeGameSubstringByIndex(game: String, index: Int) -> String {
    return game.components(separatedBy: ",")[index]
}

func printableTicTacToeGame(game: String) -> String {
    // TODO: break into rows using widht and height and replace symboles with markers
    
    var printString = ""
    let width = Int(getTicTacToeGameSubstringByIndex(game: game, index: widthIndex))!
    let height = Int(getTicTacToeGameSubstringByIndex(game: game, index: heightIndex))!
    let gameboard = getTicTacToeGameSubstringByIndex(game: game, index: gameboardIndex)
    
    for y in 0..<height {
        for x in 0..<width {
            let characterLocation = y + x
            let gameboardStringIndex = gameboard.index(gameboard.startIndex, offsetBy: characterLocation)
            printString.append(gameboard[gameboardStringIndex])
        }
        printString.append("\n")
    }
    
    return printString
}

let game1 = newTicTacToeGame(width: 3, height: 3)
let isGame1Valid = validateTicTacToeGame(game: game1)
let gameboard1 = getTicTacToeGameSubstringByIndex(game: game1, index: gameboardIndex)
let printableGame1 = printableTicTacToeGame(game: game1)
print(printableGame1)

let game2 = randomTicTacToeGame(width:5, height: 5)
let isGame2Valid = validateTicTacToeGame(game: game2)
let gameboard2 = getTicTacToeGameSubstringByIndex(game: game2, index: gameboardIndex)
let printableGame2 = printableTicTacToeGame(game: game2)
print(printableGame2)

let badGame1 = "3,4,0,0,0,⭕️,❌,000000000"
let isBadGame1Valid = validateTicTacToeGame(game: badGame1)

let badGame2 = "3,3,0,0,0,⭕️,❌,00000000"
let isBadGame2Valid = validateTicTacToeGame(game: badGame2)

let badGame3 = "3,3,0,0,0,⭕️,000000000"
let isBadGame3Valid = validateTicTacToeGame(game: badGame3)

let badGame4 = ""
let isBadGame4Valid = validateTicTacToeGame(game: badGame4)

let myString = "abcedfg"
let characterLocationIndex = myString.index(myString.startIndex, offsetBy: 3)
let myCharacter = myString[characterLocationIndex]
