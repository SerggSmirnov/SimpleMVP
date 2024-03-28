//
//  ModuleGammaPresenter.swift
//  SimpleMVP
//
//  Created by Sergei Smirnov on 27.03.2024.
//

import Foundation

protocol ModuleGammaPresenterProtocol {
    var title: String { get }
    
    func viewDidLoad()
}

final class ModuleGammaPresenter: ModuleGammaPresenterProtocol {
    
    weak var view: ModuleGammaViewProtocol?
    
    private let dataBaseService: DataBaseServiceProtocol
    private let router: ModuleGammaRouterProtocol
    private let someParam: String

    var title: String { "Module G" }
    
    var analiticScreenName: String { "super_g" }
    
    // someParam - параметр, который получает модуль из другого модуля (в нашем случае модуль Alpha)
    init(
        someParam: String,
        dataBaseService: DataBaseServiceProtocol,
        router: ModuleGammaRouterProtocol
    ) {
        self.dataBaseService = dataBaseService
        self.router = router
        self.someParam = someParam
    }
    
    deinit {
        print(">>> ModuleGammaPresenter is deinit")
    }
    
    func viewDidLoad() {
        let model = ModuleGammaView.Model(
            text: someParam
        )
        view?.update(model: model)
    }
}
