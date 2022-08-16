//
//  GameViewModel.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import Foundation
import Combine

class GameViewModel {
    
    // MARK: - Output
    @Published var error: String?
    @Published var game = GuessTheNumberGame()
    
    func generateRandomNumber() -> Int {
        return Int.random(in: game.minNumber...game.maxNumber)
    }
    
    func validatePlayerAnsver(guess: Int) -> NumberValid {
        if game.computer.number < guess {
            game.player.triesCount += 1
            return .less
        } else if game.computer.number > guess {
            game.player.triesCount += 1
            return .greater
        } else {
            game.player.numberGuessed = true
            return .equal
        }
    }
    
    func validateComputerAnsver(ansver: NumberValid) {
        if ansverIsCorrect(ansver: ansver) {
            switch ansver {
            case .greater:
                game.minNumber = game.computer.number
                game.computer.triesCount += 1
                let number = (game.minNumber + game.maxNumber) / 2
                game.computer.number = number
            case .less:
                game.maxNumber = game.computer.number
                game.computer.triesCount += 1
                let number = (game.minNumber + game.maxNumber) / 2
                game.computer.number = number
            case .equal:
                game.player.numberGuessed = true
            }
        }
    }
    
    private func ansverIsCorrect(ansver: NumberValid) -> Bool {
        if ansver == .less && game.player.number >= game.computer.number {
            error = "The hidden number is not less than what the computer indicated"
            return false
        } else if ansver == .greater && game.player.number <= game.computer.number {
            error = "The hidden number is not greater than what the computer indicated"
            return false
        } else if ansver == .equal && game.player.number != game.computer.number {
            error = "The guessed number is not equal to the one indicated by the computer"
            return false
        }
        return true
    }
    
}
