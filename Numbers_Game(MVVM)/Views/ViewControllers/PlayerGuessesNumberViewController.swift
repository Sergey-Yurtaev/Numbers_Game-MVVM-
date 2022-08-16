//
//  PlayerGuessesNumberViewController.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit
import Combine

class PlayerGuessesNumberViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var playerGuessesNumberView = PlayerGuessesNumberView()
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Public properties
    var viewModel: GameViewModel!
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = playerGuessesNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
        
        viewModel.game.minNumber = 0
        viewModel.game.maxNumber = 100
        viewModel.game.computer.number = viewModel.generateRandomNumber()
        
        playerGuessesNumberView.guessTheNumberButton.addTarget(
            self, action: #selector(guessTheNumberButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Private methods
    private func setupBindings() {
        viewModel.$game
            .sink { game in
                self.playerGuessesNumberView.numberOfGuessesLabel.text = "Try №\(game.player.triesCount)"
            }
            .store(in: &subscriptions)
    }
    
    private func validateResponse(responce: NumberValid) {
        if responce != .equal {
            playerGuessesNumberView.resultLabel.text = "No, my number is \(responce.rawValue) than yours"
        } else {
            goToResultView()
        }
    }
    
    // MARK: - @objc methods
    @objc func guessTheNumberButtonPressed(_ sender: UIButton) {
        guard let inputValue = playerGuessesNumberView.guessTheNumberTextField.text else {
            return
        }
        
        if let number = Int(inputValue) {
            if number >= 1 && number <= 100 {
                let result = viewModel.validatePlayerAnsver(guess: number)
                validateResponse(responce: result)
            } else {
                showErrorAlert()
            }
        } else {
            showErrorAlert()
        }
    }
    
    // MARK: - Navigation
    private func goToResultView() {
        let viewController = ResultsGameViewController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let aletrController = getGameAlert(title: "Error", message: "Please enter a number from 0 to 100")
        
        present(aletrController, animated: true)
    }
    
    deinit {
        print("PlayerGuessesNumberViewController has been dealocated")
    }
    
}

// MARK: - Dismiss keyboard
extension PlayerGuessesNumberViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
