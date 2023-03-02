//
//  InfoView.swift
//  Quiet
//
//  Created by Milena Lima de Alcântara on 29/09/22.
//

import UIKit

class InfoView: UIView {
    // MARK: - Properties
    lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "backgroundSheet")
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var aboutTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sobre o app"
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .label
        return label
    }()
    
    lazy var aboutBodyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        O Quiet propõe uma experiência sensorial por meio de uma interface simples e imersiva. Nele você pode explorar os diferentes elementos da tela para interagir com os sons naturais cuidadosamente selecionados para oferecer a experiência relaxante de uma praia.

        Esperamos que você aproveite ao máximo a sua jornada conosco.
        """
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        print(label.font.pointSize)
        return label
    }()
    
    lazy var creditsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Créditos"
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .label
        return label
    }()
    
    lazy var creditsBodyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        Efeitos sonoros obtidos de:

        • https://www.zapsplat.com/
        • https://pixabay.com/
        """
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        print(label.font.pointSize)
        return label
    }()

    override func layoutSubviews() {
        addSubview(backgroundImage)
        setupScrollView()
        configureConstraints()
        
    }
    
    // MARK: - Helper functions
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        configureContainerView()
    }
    
    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(aboutTitleLabel)
        scrollStackViewContainer.addArrangedSubview(aboutBodyTextLabel)
        scrollStackViewContainer.addArrangedSubview(creditsTitleLabel)
        scrollStackViewContainer.addArrangedSubview(creditsBodyTextLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            aboutTitleLabel.topAnchor.constraint(equalTo: scrollStackViewContainer.topAnchor, constant: 10),
            aboutTitleLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor),
            aboutTitleLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9),

            aboutBodyTextLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 10),
            aboutBodyTextLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor),
            aboutBodyTextLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9),

            creditsTitleLabel.topAnchor.constraint(equalTo: aboutBodyTextLabel.bottomAnchor, constant: 50),
            creditsTitleLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor),
            creditsTitleLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9),

            creditsBodyTextLabel.topAnchor.constraint(equalTo: creditsTitleLabel.bottomAnchor, constant: 10),
            creditsBodyTextLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor),
            creditsBodyTextLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9),
        ])
    }
}


