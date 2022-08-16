//
//  GameAlertController.swift
//  Numbers_Game(MVVM)
//
//  Created by  Sergey Yurtaev on 16.08.2022.
//

import UIKit

func getGameAlert(title: String, message: String?) -> UIAlertController {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let actionOK = UIAlertAction(title: "Ok", style: .default)
    
    alert.addAction(actionOK)
    
    return alert

}
