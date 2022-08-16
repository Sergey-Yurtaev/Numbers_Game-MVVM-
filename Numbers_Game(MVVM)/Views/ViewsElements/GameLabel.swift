//
//  GameLabel.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class GameLabel: UILabel {

    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure(text: nil)
    }
    
    // MARK: - Required methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(text: String?) {
        super.init(frame: .zero)
        
        configure(text: text)
    }
    
    // MARK: - Private methods
    private func configure(text: String?) {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 20)
        textColor = .white
        
        self.text = text ?? ""
    }
}
