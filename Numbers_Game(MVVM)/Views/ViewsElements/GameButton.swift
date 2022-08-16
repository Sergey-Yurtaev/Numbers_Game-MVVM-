//
//  GameButton.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

class GameButton: UIButton {
        
    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure(title: nil)
    }
    
    // MARK: - Required methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(title: String?) {
        super.init(frame: .zero)
        
        configure(title: title)
    }
    
    // MARK: - Private methods
    private func configure(title: String?) {
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        setTitle(title ?? "", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel?.numberOfLines = 1
//        alpha = 0.8
        backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        layer.cornerRadius = 15
    }

}
