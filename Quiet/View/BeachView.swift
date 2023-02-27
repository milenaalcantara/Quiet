//
//  BeachView.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 08/09/22.
//

import AVFoundation
import Lottie
import UIKit
import SpriteKit

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
    var i = 0 // o que é i?
    
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
        infoButton.isAccessibilityElement = true
        infoButton.accessibilityTraits = .button
        infoButton.accessibilityLabel = "Informações do aplicativo"
//        button.accessibilityValue = isPlaying ? "Informações" : "Desligado"
        infoButton.accessibilityHint = "informações"
        return infoButton
    }()

    lazy var soundButton: UIButton = {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 22)
        let icon = UIImage(systemName: "speaker.slash", withConfiguration: iconConfig)?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        let soundButton = UIButton()
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        soundButton.setImage(icon, for: .normal)
        soundButton.addTarget(self, action: #selector(didTapSoundButton), for: .touchUpInside)
        soundButton.isAccessibilityElement = true
        soundButton.accessibilityTraits = .button
        soundButton.accessibilityLabel = "Som ambiente"
        soundButton.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        soundButton.accessibilityHint = "clique duas vezes para som ambiente"
        
        return soundButton
    }()
    
    lazy var sunAsset: UIImageView = {
       let sunAsset = UIImageView(image: UIImage(named: "sun"))
        sunAsset.translatesAutoresizingMaskIntoConstraints = false

        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSunAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1

        sunAsset.addGestureRecognizer(tapPlayGesture)
        sunAsset.isUserInteractionEnabled = true

        // gaivota
        sunAsset.isAccessibilityElement = true
        sunAsset.accessibilityTraits = .button
        sunAsset.accessibilityLabel = "Gaivotas"
        sunAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        sunAsset.accessibilityHint = "clique duas vezes para som de gaivotas"
        
        return sunAsset
    }()

    lazy var oceanAsset: LottieAnimationView = {
        let oceanView: LottieAnimationView
        oceanView = .init(name: "ocean-gradient")
        oceanView.loopMode = .loop
        oceanView.play()
        oceanView.contentMode = .scaleToFill
        oceanView.translatesAutoresizingMaskIntoConstraints = false

        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOceanAsset))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1

        oceanView.addGestureRecognizer(tapPlayGesture)
        oceanView.isUserInteractionEnabled = true

        boatAsset.accessibilityTraits = .button
        boatAsset.accessibilityLabel = "Oceano"
        boatAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        boatAsset.accessibilityHint = "clique duas vezes para som das ondas"

        return oceanView
    }()

    lazy var boatAsset: UIImageView = {
        let boatAsset = UIImageView(image: UIImage(named: "boat"))
        boatAsset.translatesAutoresizingMaskIntoConstraints = false
        boatAsset.accessibilityTraits = .button
        boatAsset.accessibilityLabel = "Sem som"
        boatAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        boatAsset.accessibilityHint = "sem som"
        return boatAsset
    }()

    lazy var coconutTreeAsset: SKView = {
        let coconutTreeAsset = SKView()
        coconutTreeAsset.backgroundColor = .clear
        let scene = SKScene()
        scene.backgroundColor = .clear
        let no = Node(animation: .treeBreath)
        scene.addChild(no)
//        scene.run(no.animationBreath.action)
        coconutTreeAsset.presentScene(scene)
        coconutTreeAsset.translatesAutoresizingMaskIntoConstraints = false
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCoconutTreeAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        coconutTreeAsset.addGestureRecognizer(tapPlayGesture)
        coconutTreeAsset.isUserInteractionEnabled = true
        return coconutTreeAsset
    }()

    lazy var shellAsset: UIImageView = {
        let shellAsset = UIImageView(image: UIImage(named: "shell"))
        shellAsset.translatesAutoresizingMaskIntoConstraints = false
        shellAsset.isAccessibilityElement = true
        shellAsset.accessibilityTraits = .button
        shellAsset.accessibilityLabel = "Sem som"
        shellAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        shellAsset.accessibilityHint = "sem som"

        return shellAsset
    }()
    
    lazy var starAsset: UIImageView = {
        let starAsset = UIImageView(image: UIImage (named: "star"))
        starAsset.translatesAutoresizingMaskIntoConstraints = false
        starAsset.isAccessibilityElement = true
        starAsset.accessibilityTraits = .button
        starAsset.accessibilityLabel = "Sem som"
        starAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        starAsset.accessibilityHint = "sem som"
        
        return starAsset
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
        
    @objc func didTapSunAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapSunAsset()
    }

    @objc func didTapOceanAsset(_ gesture: UITapGestureRecognizer) {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        delegate?.didTapOceanAsset()
        
        infoButton.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        soundButton.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        starAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        sunAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        shellAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        boatAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
//        oceanAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        coconutTreeAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        
    }

    @objc func didTapCoconutTreeAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapCoconutAsset()
    }
}

extension BeachView: ViewCodingProtocol {
    func setupHierarchy() {
        addSubview(backgroundImageView)
        addSubview(infoButton)
        addSubview(soundButton)
        addSubview(sunAsset)
        addSubview(oceanAsset)
        addSubview(boatAsset)
        addSubview(coconutTreeAsset)
        addSubview(shellAsset)
        addSubview(starAsset)

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
            backgroundImageView.heightAnchor.constraint(equalTo: heightAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: 4),
            backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func infoButtonConstraints() {
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            infoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.01),
            infoButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.20),
            infoButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.20)
        ])
    }

    func soundButtonConstraints() {
        NSLayoutConstraint.activate([
            soundButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            soundButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: frame.width * -0.01),
            soundButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.20),
            soundButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.20)
        ])
    }

    func oceanAssetConstraints() {
        NSLayoutConstraint.activate([
            oceanAsset.centerXAnchor.constraint(equalTo: centerXAnchor),
            oceanAsset.centerYAnchor.constraint(equalTo: centerYAnchor, constant: frame.height * 0.10),
            oceanAsset.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30),
            oceanAsset.widthAnchor.constraint(equalTo: widthAnchor, constant: 2)
            ])
    }

    func sunAssetConstraints() {
        NSLayoutConstraint.activate([
            sunAsset.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.15),
            sunAsset.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            sunAsset.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            sunAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.height * 0.05),
        ])
    }

    func boatAssetConstraints() {
        NSLayoutConstraint.activate([
            boatAsset.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            boatAsset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            boatAsset.trailingAnchor.constraint(equalTo: starAsset.trailingAnchor),
            boatAsset.topAnchor.constraint(equalTo: centerYAnchor, constant: frame.height * -0.10)
        ])
    }

    func coconutTreeAssetConstraints() {
        NSLayoutConstraint.activate([
            coconutTreeAsset.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30),
            coconutTreeAsset.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            coconutTreeAsset.centerXAnchor.constraint(equalTo: sunAsset.centerXAnchor),
            coconutTreeAsset.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: frame.height * -0.06)
        ])
    }

    func shellAssetConstrainst() {
        NSLayoutConstraint.activate([
            shellAsset.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.10),
            shellAsset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.10),
            shellAsset.trailingAnchor.constraint(equalTo: boatAsset.leadingAnchor),
            shellAsset.bottomAnchor.constraint(equalTo: bottomAnchor, constant: frame.height * -0.15)
            ])
    }

    func starAssetConstraints() {
        NSLayoutConstraint.activate([
            starAsset.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.08),
            starAsset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.08),
            starAsset.trailingAnchor.constraint(equalTo: trailingAnchor, constant: frame.width * -0.10),
            starAsset.bottomAnchor.constraint(equalTo: coconutTreeAsset.bottomAnchor, constant: -10)
        ])
    }

}
