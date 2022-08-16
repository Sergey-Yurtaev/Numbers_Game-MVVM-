//
//  StartGameView.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class StartGameView: UIView {
    
    // MARK: - Private properties
    private lazy var gameTitleLabel = GameLabel(text: "Try this funny game :)")
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Public properties
    var startNewGameButton = GameButton(title: "New Game")

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
        
        addSubview(gameTitleLabel)
        addSubview(startNewGameButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            gameTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            gameTitleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
  
            startNewGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            startNewGameButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            startNewGameButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startNewGameButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startNewGameButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
