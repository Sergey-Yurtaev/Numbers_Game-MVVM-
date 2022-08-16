//
//  EnterNumberViewController.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class EnterNumberViewController: UIViewController {

    // MARK: - Private properties
    private lazy var enterNumberView = EnterNumberView()
    
    // MARK: - Public properties
    var viewModel = GameViewModel()
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = enterNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterNumberView.guessTheNumberTextField.delegate = self
        
        enterNumberView.enterTheNumberButton.isUserInteractionEnabled = false
        enterNumberView.enterTheNumberButton.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.8036071202, blue: 0.7652545357, alpha: 1)
        enterNumberView.enterTheNumberButton.addTarget(self, action: #selector(enterTheNumberButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - @objc methods
    @objc private func enterTheNumberButtonPressed(_ sender: UIButton) {
        guard let inputValue = enterNumberView.guessTheNumberTextField.text else {
            return
        }
        
        if let number = Int(inputValue) {
            if number >= 1 && number <= 100 {
                viewModel.game.player.number = number
                startComputerGuessingNumber()
            } else {
                showErrorAlert()
            }
        } else {
            showErrorAlert()
        }
    }
    
    // MARK: - Navigation
    private func startComputerGuessingNumber() {
        let viewController = ComputerGuessesNumberViewController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let aletrController = getGameAlert(title: "Error", message: "Please enter a number from 1 to 100")
        
        present(aletrController, animated: true)
    }
}

// MARK: - Dismiss keyboard
extension EnterNumberViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// MARK: - UITextFieldDelegate
extension EnterNumberViewController: UITextFieldDelegate {
  
    func textFieldDidEndEditing(_ textField: UITextField) {
        enterNumberView.enterTheNumberButton.isUserInteractionEnabled = true
        enterNumberView.enterTheNumberButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }

}
