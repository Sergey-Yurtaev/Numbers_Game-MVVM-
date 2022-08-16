//
//  PlayerGuessesNumberView.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class PlayerGuessesNumberView: UIView {
    
    // MARK: - Public properties
    lazy var numberOfGuessesLabel = GameLabel(text: "Try №")
    lazy var playerGuessesLabel = GameLabel(text: "You are guessing")
    lazy var resultLabel = GameLabel(text: "Enter number")
    lazy var guessTheNumberTextField = NumberTextField()
    lazy var guessTheNumberButton = GameButton(title: "Guess")
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Required methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupView() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.link.cgColor, UIColor.white.cgColor]
        
        addSubview(numberOfGuessesLabel)
        addSubview(playerGuessesLabel)
        addSubview(guessTheNumberTextField)
        addSubview(guessTheNumberButton)
        addSubview(resultLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            numberOfGuessesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberOfGuessesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            numberOfGuessesLabel.bottomAnchor.constraint(lessThanOrEqualTo: playerGuessesLabel.topAnchor),
            
            playerGuessesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            playerGuessesLabel.topAnchor.constraint(equalTo: numberOfGuessesLabel.bottomAnchor, constant: 10),
            playerGuessesLabel.bottomAnchor.constraint(lessThanOrEqualTo: guessTheNumberTextField.topAnchor),
            
            guessTheNumberTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            guessTheNumberTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            guessTheNumberTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            guessTheNumberTextField.bottomAnchor.constraint(lessThanOrEqualTo: guessTheNumberButton.topAnchor, constant: -40),
            
            resultLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: guessTheNumberTextField.topAnchor, constant: -50),
            
            guessTheNumberButton.heightAnchor.constraint(equalToConstant: 48),
            guessTheNumberButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            guessTheNumberButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 20),
            guessTheNumberButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            guessTheNumberButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
}
