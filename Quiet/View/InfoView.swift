//
//  InfoView.swift
//  Quiet
//
//  Created by Milena Lima de Alcântara on 29/09/22.
//

import UIKit

class InfoView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Properties
    lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "backgroundSheet")
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var aboutTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sobre o app"
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .label
        return label
    }()

    lazy var aboutTextCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(white: 0, alpha: 0.05)
        view.layer.cornerRadius = 12
        return view
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

    lazy var creditsSoundsTextCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(white: 0, alpha: 0.05)
        view.layer.cornerRadius = 12
        return view
    }()

    lazy var creditsSoundsBodyTextLabel: UILabel = {
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
        return label
    }()
    
    lazy var creditsIlustrationsTextCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(white: 0, alpha: 0.05)
        view.layer.cornerRadius = 12
        return view
    }()

    lazy var creditsIlustrationsBodyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        Ilustrações criadas por:

        • Caroline Nogueira
        • Hanah Santana
        • Israel Carvalho
        • Milena Alcântara
        • Moyses Azevedo
        """
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setupBackground()
        setupScrollView()
        setupViews()
    }
    
    func setupBackground() {
        addSubview(backgroundImage)
        backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func setupScrollView(){
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
        contentView.addSubview(aboutTitleLabel)
        aboutTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        aboutTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        aboutTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        aboutTextCard.addSubview(aboutBodyTextLabel)
        aboutBodyTextLabel.centerXAnchor.constraint(equalTo: aboutTextCard.centerXAnchor).isActive = true
        aboutBodyTextLabel.centerYAnchor.constraint(equalTo: aboutTextCard.centerYAnchor).isActive = true
        aboutBodyTextLabel.widthAnchor.constraint(equalTo: aboutTextCard.widthAnchor, multiplier: 0.9).isActive = true

        contentView.addSubview(aboutTextCard)
        aboutTextCard.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 10).isActive = true
        aboutTextCard.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        aboutTextCard.heightAnchor.constraint(equalTo: aboutBodyTextLabel.heightAnchor, multiplier: 1.1).isActive = true
        aboutTextCard.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        contentView.addSubview(creditsTitleLabel)
        creditsTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        creditsTitleLabel.topAnchor.constraint(equalTo: aboutTextCard.bottomAnchor, constant: 50).isActive = true
        creditsTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        

        creditsSoundsTextCard.addSubview(creditsSoundsBodyTextLabel)
        creditsSoundsBodyTextLabel.centerXAnchor.constraint(equalTo: creditsSoundsTextCard.centerXAnchor).isActive = true
        creditsSoundsBodyTextLabel.centerYAnchor.constraint(equalTo: creditsSoundsTextCard.centerYAnchor).isActive = true
        creditsSoundsBodyTextLabel.widthAnchor.constraint(equalTo: creditsSoundsTextCard.widthAnchor, multiplier: 0.9).isActive = true

        contentView.addSubview(creditsSoundsTextCard)
        creditsSoundsTextCard.topAnchor.constraint(equalTo: creditsTitleLabel.bottomAnchor, constant: 10).isActive = true
        creditsSoundsTextCard.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        creditsSoundsTextCard.heightAnchor.constraint(equalTo: creditsSoundsBodyTextLabel.heightAnchor, multiplier: 1.1).isActive = true
        creditsSoundsTextCard.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        creditsIlustrationsTextCard.addSubview(creditsIlustrationsBodyTextLabel)
        creditsIlustrationsBodyTextLabel.centerXAnchor.constraint(equalTo: creditsIlustrationsTextCard.centerXAnchor).isActive = true
        creditsIlustrationsBodyTextLabel.centerYAnchor.constraint(equalTo: creditsIlustrationsTextCard.centerYAnchor).isActive = true
        creditsIlustrationsBodyTextLabel.widthAnchor.constraint(equalTo: creditsIlustrationsTextCard.widthAnchor, multiplier: 0.9).isActive = true

        contentView.addSubview(creditsIlustrationsTextCard)
        creditsIlustrationsTextCard.topAnchor.constraint(equalTo: creditsSoundsTextCard.bottomAnchor, constant: 10).isActive = true
        creditsIlustrationsTextCard.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        creditsIlustrationsTextCard.heightAnchor.constraint(equalTo: creditsIlustrationsBodyTextLabel.heightAnchor, multiplier: 1.1).isActive = true
        creditsIlustrationsTextCard.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        creditsIlustrationsTextCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true // a chave é essa
        
    }
}
