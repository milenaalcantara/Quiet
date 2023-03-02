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
        configureBackgroundImageConstraints()
        configureScrollViewConstraints()
        configureTitlesConstraints()
        configureBodyTextsConstraints()
    }
    
    func configureBackgroundImageConstraints() {
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func configureScrollViewConstraints() {
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func configureTitlesConstraints() {
        aboutTitleLabel.topAnchor.constraint(equalTo: scrollStackViewContainer.topAnchor, constant: 10).isActive = true
        aboutTitleLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor).isActive = true
        aboutTitleLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9).isActive = true
        
        creditsTitleLabel.topAnchor.constraint(equalTo: aboutBodyTextLabel.bottomAnchor, constant: 50).isActive = true
        creditsTitleLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor).isActive = true
        creditsTitleLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9).isActive = true
        
    }
    
    func configureBodyTextsConstraints() {
        aboutBodyTextLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 10).isActive = true
        aboutBodyTextLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor).isActive = true
        aboutBodyTextLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9).isActive = true

        creditsBodyTextLabel.topAnchor.constraint(equalTo: creditsTitleLabel.bottomAnchor, constant: 10).isActive = true
        creditsBodyTextLabel.centerXAnchor.constraint(equalTo: scrollStackViewContainer.centerXAnchor).isActive = true
        creditsBodyTextLabel.widthAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.9).isActive = true
    }
}


