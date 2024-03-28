//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleBetaRouterProtocol {
    
    // Устанавливаем основной UIViewController
    func setRootViewController(root: UIViewController)
    
    // Модуль Beta показывает модуль Gamma и передает в него параметры.
    func openModuleGamma(with param: String)
    
    func showSuccess()
    func showError()
    func showConfirmation(completion: @escaping () -> Void)
}

final class ModuleBetaRouter: ModuleBetaRouterProtocol {
        
    weak var root: UIViewController?
    private let factory: ModuleGammaFactory
    private let alertFactory: AlertModuleFactory
    
    init(factory: ModuleGammaFactory, alertFactory: AlertModuleFactory) {
        self.factory = factory
        self.alertFactory = alertFactory
    }
    
    func setRootViewController(root: UIViewController) {
        self.root = root
    }
    
    func openModuleGamma(with param: String) {
        let context = ModuleGammaFactory.Context(
            someParam: param,
            someValue: 100
        )
        
        let viewController = factory.make(context: context)
        
        root?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showSuccess() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save success"
        )
        
        root?.present(viewController, animated: true)
    }
    
    func showError() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save error"
        )
        
        root?.present(viewController, animated: true)
    }
    
    func showConfirmation(completion: @escaping () -> Void) {
        let viewController = alertFactory.makeDialog(
            title: "Module Beta",
            message: "Save changes?"
        ) { completion() }
        
        root?.present(viewController, animated: true)
    }
}
