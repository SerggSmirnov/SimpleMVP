//
//  ModuleBetaPresenter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import Foundation

protocol ModuleBetaPresenterProtocol {
    var title: String { get }
    
    func viewDidLoad()
    func saveData()
    func tapButtonToModuleGamma()
    func showConfirmation()
}

final class ModuleBetaPresenter: ModuleBetaPresenterProtocol {
    
    weak var view: ModuleBetaViewProtocol?
    
    private let dataBaseService: DataBaseServiceProtocol
    private let router: ModuleBetaRouterProtocol
    private let someParam: String

    var title: String { "Module B" }
    
    var analiticScreenName: String { "super_b" }
    
    // someParam - параметр, который получает модуль из другого модуля (в нашем случае модуль Alpha)
    init(
        someParam: String,
        dataBaseService: DataBaseServiceProtocol,
        router: ModuleBetaRouterProtocol
    ) {
        self.dataBaseService = dataBaseService
        self.router = router
        self.someParam = someParam
    }
    
    deinit {
        print(">>> ModuleBetaPresenter is deinit")
    }
    
    func viewDidLoad() {
        let model = ModuleBetaView.Model(
            text: someParam
        )
        view?.update(model: model)
    }
    
    func showConfirmation() {
        router.showConfirmation { [weak self] in
            self?.saveData()
        }
    }
    
    func saveData() {
        dataBaseService.storeData(value: someParam) { [weak self] (result: Result<Void, Error>) in
            guard let self else { return }
            
            switch result {
            case .success:
                router.showSuccess()
            case .failure:
                router.showError()
            }
        }
    }
    
    func tapButtonToModuleGamma() {
        router.openModuleGamma(with: "params from module Beta")
    }
}
