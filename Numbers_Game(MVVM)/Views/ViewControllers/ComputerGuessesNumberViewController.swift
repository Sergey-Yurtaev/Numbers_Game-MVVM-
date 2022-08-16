//
//  ComputerGuessesNumberViewController.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit
import Combine

class ComputerGuessesNumberViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var computerGuessesNumberView = ComputerGuessesNumberView()
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Public properties
    var viewModel: GameViewModel!
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = computerGuessesNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.game.computer.number = viewModel.generateRandomNumber()
        
        computerGuessesNumberView.equalButton.addTarget(
            self, action: #selector(equalButtonPressed(_:)), for: .touchUpInside)
        computerGuessesNumberView.greaterthanButton.addTarget(
            self, action: #selector(greaterButtonPressed(_:)), for: .touchUpInside)
        computerGuessesNumberView.lessButton.addTarget(
            self, action: #selector(lessButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Bind view model
    private func setupBindings() {
        viewModel.$error
            .sink { error in
                DispatchQueue.main.async {
                    guard let errorDiscription = self.viewModel.error else { return }
                    let alertController = getGameAlert(title: "Tricky bug", message: errorDiscription)
                    self.present(alertController, animated: true)
                }
            }
            .store(in: &subscriptions)
        viewModel.$game
            .sink { game in
                self.computerGuessesNumberView.guessesLabel.text = "Your number is: \(game.computer.number)?"
                self.computerGuessesNumberView.numberOfGuessesLabel.text = "Try №\(game.computer.triesCount)"
            }
            .store(in: &subscriptions)
    }
    
    // MARK: - @objc methods
    @objc private func equalButtonPressed(_ sender: UIButton) {
        viewModel.validateComputerAnsver(ansver: .equal)
        if viewModel.game.player.numberGuessed == true {
            startPlayerGuessingNumber()
        }
    }
    
    @objc private func greaterButtonPressed(_ sender: UIButton) {
        viewModel.validateComputerAnsver(ansver: .greater)
    }
    
    @objc private func lessButtonPressed(_ sender: UIButton) {
        viewModel.validateComputerAnsver(ansver: .less)
    }
    
    // MARK: - Navigation
    private func startPlayerGuessingNumber() {
        let viewController = PlayerGuessesNumberViewController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
}
