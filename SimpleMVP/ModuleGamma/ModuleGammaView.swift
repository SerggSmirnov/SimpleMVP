//
//  ModuleGammaView.swift
//  SimpleMVP
//
//  Created by Sergei Smirnov on 27.03.2024.
//

import UIKit

final class ModuleGammaView: UIView {
    struct Model {
        let text: String
    }
    
    private let presenter: ModuleGammaPresenterProtocol
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Waiting..."
        return label
    }()

    init(presenter: ModuleGammaPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: ModuleGammaView.Model) {
        label.text = model.text
    }
}

private extension ModuleGammaView {
    func commonInit() {
        backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        addSubview(label)
    }

    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
