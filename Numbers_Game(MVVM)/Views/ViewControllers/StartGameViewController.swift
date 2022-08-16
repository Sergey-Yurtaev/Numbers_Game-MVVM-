//
//  StartGameViewController.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class StartGameViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var startGameView = StartGameView()
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = startGameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameView.startNewGameButton.addTarget(self, action: #selector(startNewGameButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Navigation
    @objc private func startNewGameButtonPressed(_ sender: UIButton) {
        let viewController = EnterNumberViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    deinit {
        print("StartGameViewController has been dealocated")
    }
    
}
