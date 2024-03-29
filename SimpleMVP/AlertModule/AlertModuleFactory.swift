//
//  AlertModuleFactory.swift
//  SimpleMVVM
//
//  Created by Dmitriy Mirovodin on 16.02.2024.
//

import UIKit

final class AlertModuleFactory {
    
    func make(title: String, message: String) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        alertViewController.addAction(action)
        
        return alertViewController
    }
    
    func makeDialog(
        title: String,
        message: String,
        onConfirm: @escaping () -> Void
    ) -> UIViewController {
        
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let actionOk = UIAlertAction(
            title: "Ok",
            style: .default
        ) { _ in onConfirm() }
        
        let actionCancel = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        
        alertViewController.addAction(actionCancel)
        alertViewController.addAction(actionOk)
        
        return alertViewController
    }
}
