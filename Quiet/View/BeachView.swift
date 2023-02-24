//
//  BeachView.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 08/09/22.
//

import AVFoundation
import Lottie
import UIKit

protocol BeachViewDelegate: AnyObject {
    func didTapInfoButton()
    func didTapSoundButton()
    func didTapOceanAsset()
    func didTapSunAsset()
    func didTapCoconutAsset()
}

class BeachView: UIView {
    weak var delegate: BeachViewDelegate?
    
    var player: AVAudioPlayer!
    var i = 0
    
    var isPlaying = false

    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background")
        let backgroundView = UIImageView(image: backgroundImage)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()

    lazy var infoButton: UIButton = {
        let infoButton = UIButton(type: .infoLight)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.tintColor = .darkGray
        infoButton.addTarget(self, action: #selector(didTapInfoButton), for: .touchUpInside)
        button.isAccessibilityElement = true
        button.accessibilityTraits = .button
        button.accessibilityLabel = "Tutorial do aplicativo"
        button.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        button.accessibilityHint = "tutorial"
        return infoButton
    }()

    lazy var soundButton: UIButton = {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 22)
        let icon = UIImage(systemName: "speaker.slash", withConfiguration: iconConfig)?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(tapSoundButtonAction), for: .touchUpInside)
        button.isAccessibilityElement = true
        button.accessibilityTraits = .button
        button.accessibilityLabel = "Som ambiente"
        button.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        button.accessibilityHint = "clique duas vezes para som ambiente"
        
        return button
    }()
    
    lazy var estrelaAsset: UIImageView = {
        let estrelaView = UIImageView(image: UIImage (named: "estrela"))
        estrelaView.translatesAutoresizingMaskIntoConstraints = false
        estrelaView.isAccessibilityElement = true
        estrelaView.accessibilityTraits = .button
        estrelaView.accessibilityLabel = "Sem som"
        estrelaView.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        estrelaView.accessibilityHint = "sem som"
        return estrelaView
    }()

    lazy var sunAsset: UIImageView = {
       let sunAsset = UIImageView(image: UIImage(named: "sun"))
        sunAsset.translatesAutoresizingMaskIntoConstraints = false

        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSunAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1

        sunAsset.addGestureRecognizer(tapPlayGesture)
        sunAsset.isUserInteractionEnabled = true

        solView.isAccessibilityElement = true
        solView.accessibilityTraits = .button
        solView.accessibilityLabel = "Som Gaivotas"
        solView.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        solView.accessibilityHint = "clique duas vezes para som de gaivotas"
        
        return sunAsset
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background222")
        let backgroundView = UIImageView(image: backgroundImage)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
    
        return backgroundView
    }()
    
    lazy var conchaAsset : UIImageView = {
        let conchaView = UIImageView(image: UIImage(named: "concha"))
        conchaView.translatesAutoresizingMaskIntoConstraints = false
        conchaView.isAccessibilityElement = true
        conchaView.accessibilityTraits = .button
        conchaView.accessibilityLabel = "Sem som"
        conchaView.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        conchaView.accessibilityHint = "sem som"

        return conchaView
    }()

    lazy var starAsset: UIImageView = {
        let starAsset = UIImageView(image: UIImage (named: "star"))
        starAsset.translatesAutoresizingMaskIntoConstraints = false
        barcoView.isAccessibilityElement = true
        barcoView.accessibilityTraits = .button
        barcoView.accessibilityLabel = "Sem som"
        barcoView.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        barcoView.accessibilityHint = "sem som"
        
        return starAsset
    }()

    lazy var boatAsset: UIImageView = {
        let boatAsset = UIImageView(image: UIImage(named: "boat"))
        boatAsset.translatesAutoresizingMaskIntoConstraints = false
        return boatAsset
    }()

    lazy var shellAsset: UIImageView = {
        let shellAsset = UIImageView(image: UIImage(named: "shell"))
        shellAsset.translatesAutoresizingMaskIntoConstraints = false
        return shellAsset
    }()

    lazy var coconutTreeAsset: LottieAnimationView = {
        let coconutTreeAsset: LottieAnimationView
        coconutTreeAsset = .init(name: "coqueiro")
        coconutTreeAsset.loopMode = .loop
        coconutTreeAsset.play()
        coconutTreeAsset.contentMode = .scaleToFill
        coconutTreeAsset.translatesAutoresizingMaskIntoConstraints = false
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCoconutTreeAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        
        coconutTreeAsset.addGestureRecognizer(tapPlayGesture)
        coconutTreeAsset.isUserInteractionEnabled = true
        
        oceanView.isAccessibilityElement = true
        oceanView.accessibilityTraits = .button
        oceanView.accessibilityLabel = "Som de ondas"
        oceanView.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        oceanView.accessibilityHint = "clique duas vezes para som de ondas"
        
        
        return coconutTreeAsset
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        self.setupView()
    }
}

extension BeachView {
    @objc func didTapInfoButton() {
        delegate?.didTapInfoButton()
    }

    @objc func didTapSoundButton(_ gesture: UITapGestureRecognizer) {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        delegate?.didTapSoundButton()
    }

        coqueiroView.isAccessibilityElement = true
        coqueiroView.accessibilityTraits = .button
        coqueiroView.accessibilityLabel = "Sem som"
        coqueiroView.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        coqueiroView.accessibilityHint = "sem som"
        
        
    @objc func didTapSunAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapSunAsset()
    }

    @objc func didTapOceanAsset(_ gesture: UITapGestureRecognizer) {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        delegate?.didTapOceanAsset()
        
        infoButton.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        soundButton.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        estrelaAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        sunAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        conchaAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        barcoAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        oceanAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        coconutAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        
    }

    @objc func didTapCoconutTreeAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapCoconutAsset()
    }
}

extension BeachView: ViewCodingProtocol {
    func setupHierarchy() {
        addSubview(backgroundImageView)
        addSubview(oceanAsset)
        addSubview(sunAsset)
        addSubview(shellAsset)
        addSubview(boatAsset)
        addSubview(coconutTreeAsset)
        addSubview(starAsset)
        addSubview(infoButton)
        addSubview(soundButton)
    }

    func setupConstraints() {
        backgroundImageViewConstraints()
        oceanAssetConstraints()
        sunAssetConstraints()
        shellAssetConstrainst()
        boatAssetConstraints()
        coconutTreeAssetConstraints()
        starAssetConstraints()
        infoButtonConstraints()
        soundButtonConstraints()
    }
}

private extension BeachView {
    func backgroundImageViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }

    func infoButtonConstraints() {
        NSLayoutConstraint.activate([
        infoButton.topAnchor.constraint(equalTo: topAnchor, constant: 76),
        infoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        infoButton.widthAnchor.constraint(equalToConstant: 40),
        infoButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func soundButtonConstraints() {
        NSLayoutConstraint.activate([
        soundButton.topAnchor.constraint(equalTo: topAnchor, constant: 76),
        soundButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        soundButton.widthAnchor.constraint(equalToConstant: 40),
        soundButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func oceanAssetConstraints() {
        NSLayoutConstraint.activate([
            oceanAsset.centerXAnchor.constraint(equalTo: centerXAnchor),
            oceanAsset.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 305),
            oceanAsset.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.4),
            oceanAsset.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width+10),
            oceanAsset.bottomAnchor.constraint(equalTo: shellAsset.topAnchor, constant: -70),
            oceanAsset.bottomAnchor.constraint(equalTo: coconutTreeAsset.topAnchor, constant: 130),
            oceanAsset.bottomAnchor.constraint(equalTo: coconutTreeAsset.topAnchor, constant: 130),
            oceanAsset.bottomAnchor.constraint(equalTo: starAsset.topAnchor, constant: -40),
            ])
    }

    func sunAssetConstraints() {
        NSLayoutConstraint.activate([
            sunAsset.bottomAnchor.constraint(equalTo: oceanAsset.topAnchor, constant: -80 ),
            sunAsset.heightAnchor.constraint(equalToConstant: 140),
            sunAsset.widthAnchor.constraint(equalToConstant: 150),
            sunAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }

    func shellAssetConstrainst() {
        NSLayoutConstraint.activate([
            shellAsset.heightAnchor.constraint(equalToConstant: 30),
            shellAsset.widthAnchor.constraint(equalToConstant: 30),
            shellAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            ])
    }

    func boatAssetConstraints() {
        NSLayoutConstraint.activate([
            boatAsset.bottomAnchor.constraint(equalTo: oceanAsset.topAnchor, constant: 50 ),
            boatAsset.heightAnchor.constraint(equalToConstant: 80),
            boatAsset.widthAnchor.constraint(equalToConstant: 80),
            boatAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
        ])
    }


    func coconutTreeAssetConstraints() {
        NSLayoutConstraint.activate([
        coconutTreeAsset.heightAnchor.constraint(equalToConstant: 250),
        coconutTreeAsset.widthAnchor.constraint(equalToConstant: 178),
        coconutTreeAsset.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 40),
        ])
    }

    func starAssetConstraints() {
        NSLayoutConstraint.activate([
        starAsset.heightAnchor.constraint(equalToConstant: 30),
        starAsset.widthAnchor.constraint(equalToConstant: 30),
        starAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160)
        ])

    }
}
