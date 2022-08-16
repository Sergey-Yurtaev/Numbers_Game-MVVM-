//
//  ResultsGameViewController.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class ResultsGameViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var resultGameView = ResultsGameView()
    
    // MARK: - Public properties
    var viewModel: GameViewModel!
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = resultGameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        whoIsWinner()
        
        resultGameView.goToMainMenuButton.addTarget(
            self, action: #selector(goToMainMenuButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Private methods
    private func whoIsWinner() {
        let playerTriesConut = viewModel.game.player.triesCount
        let computerTriesCount = viewModel.game.computer.triesCount
        let winner = playerTriesConut < computerTriesCount ? "You win" : "Computer win"
        
        resultGameView.playerTriesCountLabel.text = "Your's tries count: \(playerTriesConut)"
        resultGameView.computerTriesCountLabel.text = "Computer's tries count: \(computerTriesCount)"
        resultGameView.winnerLabel.text = winner
    }
    
    // MARK: - @objc methods
    @objc private func goToMainMenuButtonPressed(_ sender: UIButton) {
        goToMainMenu()
    }
    
    // MARK: - Navigation
    private func goToMainMenu() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("ResultsGameViewController has been dealocated")
    }
    
}
