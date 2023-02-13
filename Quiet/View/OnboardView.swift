//
//  OnboardView.swift
//  Quiet
//
//  Created by Moyses Miranda do Vale Azevedo on 10/02/23.
//

import UIKit

class OnboardView: UIView {
    var skipAction: (() -> Void)?

    lazy var skipButton: UIButton = {
        let skipButton = UIButton()
        skipButton.setTitle("Ir para a próxima etapa", for: .normal)
        skipButton.backgroundColor = .tintColor
        skipButton.layer.cornerRadius = 10
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)
        return skipButton
    }()


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        setupView()
        setConstraints()
    }
}


extension OnboardView {
    // ℹ️ Button action func:
    @objc func skipButtonAction() {
        skipAction?()
    }
}


extension OnboardView {
    func setupView() {
        backgroundColor = .systemBackground
        self.addSubview(skipButton)
    }
}

extension OnboardView {
    private func setConstraints() {
        skipButtonContraints()
    }

    private func skipButtonContraints() {
        NSLayoutConstraint.activate([
            skipButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44),
            skipButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
            skipButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            skipButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
