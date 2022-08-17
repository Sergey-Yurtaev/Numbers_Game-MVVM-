//
//  Game.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import Foundation

struct GuessTheNumberGame {
    var minNumber = 1
    var maxNumber = 100
    
    var player = Guesser()
    var computer = Guesser()
}
