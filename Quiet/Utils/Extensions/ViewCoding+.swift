//
//  ViewCoding+.swift
//  Quiet
//
//  Created by Moyses Miranda do Vale Azevedo on 14/02/23.
//

import Foundation

public protocol ViewCodingProtocol {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCodingProtocol {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
}
