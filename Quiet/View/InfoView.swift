//
//  InfoView.swift
//  Quiet
//
//  Created by Milena Lima de Alcântara on 29/09/22.
//

import UIKit

class InfoView: UIView {
    lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "backgroundSheet")
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var aboutSection: SectionView = {
        let section = SectionView(
            title: "Sobre o app",
            bodyText: """
              O Quiet propõe uma experiência sensorial por meio de uma interface simples e imersiva. Nele você pode explorar os diferentes elementos da tela para interagir com os sons naturais cuidadosamente selecionados para oferecer a experiência relaxante de uma praia.
            
            Esperamos que você aproveite ao máximo a sua jornada conosco.
            """)
        section.translatesAutoresizingMaskIntoConstraints = false
        
        return section
    }()
    
    lazy var creditSection: SectionView = {
        let section = SectionView(
            title: "Sons",
            bodyText: """
            Efeitos sonoros obtidos de:
            
            • https://www.zapsplat.com/
            • https://pixabay.com/
            """
//            isNeedTable: true
        )
        section.translatesAutoresizingMaskIntoConstraints = false

        return section
    }()

    override func layoutSubviews() {
        addSubview(backgroundImage)
        addSubview(aboutSection)
        addSubview(creditSection)
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            aboutSection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            aboutSection.centerXAnchor.constraint(equalTo: centerXAnchor),
            aboutSection.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            aboutSection.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.78),
            
            creditSection.topAnchor.constraint(equalTo: aboutSection.bottomAnchor, constant: 20),
            creditSection.centerXAnchor.constraint(equalTo: centerXAnchor),
            creditSection.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            creditSection.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
        ])
    }
}
