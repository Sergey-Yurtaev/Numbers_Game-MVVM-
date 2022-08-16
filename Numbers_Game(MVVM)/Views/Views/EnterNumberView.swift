//
//  EnterNumberView.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class EnterNumberView: UIView {
    
    // MARK: - Private properties
    lazy var guessTheNumberTextField = NumberTextField()
    lazy var enterTheNumberButton = GameButton(title: "Enter")
    private let gradientLayer = CAGradientLayer()

    // MARK: - Ovveride methods
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
        
        addSubview(guessTheNumberTextField)
        addSubview(enterTheNumberButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            guessTheNumberTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            guessTheNumberTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            guessTheNumberTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            guessTheNumberTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            guessTheNumberTextField.bottomAnchor.constraint(lessThanOrEqualTo: enterTheNumberButton.topAnchor),
                        
            enterTheNumberButton.heightAnchor.constraint(equalToConstant: 48),
            enterTheNumberButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            enterTheNumberButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            enterTheNumberButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterTheNumberButton.bottomAnchor.constraint(equalTo: guessTheNumberTextField.bottomAnchor, constant: 100)
        ])
    }
}
