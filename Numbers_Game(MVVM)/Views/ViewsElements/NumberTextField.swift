//
//  NumberTextField.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class NumberTextField: UITextField {
    
    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    // MARK: - Required methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        placeholder = "Your number"
        textAlignment = .center
        backgroundColor = .white
        
        borderStyle = .roundedRect

        keyboardType = .numberPad
        returnKeyType = .done
    }
    
}
