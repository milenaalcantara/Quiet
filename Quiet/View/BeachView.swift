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
    func didTapBoatAsset()
    func didTapseagullsAsset()
    func didTapStarAsset()
    func didTapShellAsset()
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
        infoButton.accessibilityHint = "informações"
        return infoButton
    }()
    
    lazy var infoButtonScreen: UIButton = {
        let infoButtonScreen = UIButton(type: .infoLight)
        infoButtonScreen.translatesAutoresizingMaskIntoConstraints = false
        infoButtonScreen.tintColor = .darkGray
        infoButtonScreen.isAccessibilityElement = true
        infoButtonScreen.accessibilityLabel = "Informações da tela"
        infoButtonScreen.tintColor = UIColor.white
        infoButtonScreen.alpha = 0.1
        infoButtonScreen.accessibilityHint = "Quiet é um app com uma tela principal colorida e elementos praianos, dividida em três partes. A parte superior da tela, ao lado esquerdo há um sol amarelado e logo em seguida, ao lado direito, gaivotas brancas com bico amarelo e detalhes pretos nas pontas das asas voando livremente, ambos em um céu azul claro. Ao centro da tela temos um oceano em movimento com ondas que vem e vão e um barco marrom com vela branca navegando no canto direito do oceano. Na parte inferior da tela tem a faixa de areia, do lado esquerda há um coqueiro criando uma pequena sombra na areia, com tronco marrom e folhas verdes em movimento. Ao centro da faixa de areia temos uma concha amarelada com detalhes em tom alaranjado com um carangueijo vermelho se escondendo atrás dela e logo mais, no cando inferior direito há uma estrela do mar vermelha com detalhes em vermelho escuro. Explore, respire e relaxe"
        return infoButtonScreen
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
        soundButton.accessibilityHint = "clique para som ambiente"
        
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
        sunAsset.accessibilityLabel = "Sol no céu azul claro"
   
        
        return sunAsset
    }()

    lazy var seagullsAsset: SKView = {
        let seagullsAsset = SKView()
        seagullsAsset.backgroundColor = .clear
        let scene = SKScene()
        scene.backgroundColor = .clear
        let no = Node(animation: .seagullOff)
        scene.addChild(no)
        seagullsAsset.presentScene(scene)
        seagullsAsset.translatesAutoresizingMaskIntoConstraints = false
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapseagullsAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        seagullsAsset.addGestureRecognizer(tapPlayGesture)
        seagullsAsset.isUserInteractionEnabled = true
        // gaivota
        seagullsAsset.isAccessibilityElement = true
        seagullsAsset.accessibilityTraits = .button
        seagullsAsset.accessibilityLabel = "Gaivotas"
        seagullsAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        seagullsAsset.accessibilityHint = "clique para som de gaivotas"
        
        return seagullsAsset
    }()

    lazy var oceanAsset: LottieAnimationView = {
        let oceanView: LottieAnimationView
        oceanView = .init(name: "ocean-gradient")
        oceanView.loopMode = .loop
        oceanView.play()
        oceanView.contentMode = .scaleToFill
        oceanView.accessibilityLabel = "Oceano"
        oceanView.accessibilityHint = "clique para som de ondas"
        oceanView.translatesAutoresizingMaskIntoConstraints = false
        oceanView.isAccessibilityElement = true
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOceanAsset))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        
        oceanView.addGestureRecognizer(tapPlayGesture)
        oceanView.isUserInteractionEnabled = true
        return oceanView
    }()


    lazy var boatAsset: SKView = {
        let boatAsset = SKView()
        boatAsset.backgroundColor = .clear
        let scene = SKScene()
        scene.backgroundColor = .clear
        let no = Node(animation: .boatOff)
        scene.addChild(no)
        boatAsset.presentScene(scene)
        boatAsset.translatesAutoresizingMaskIntoConstraints = false
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBoatAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        boatAsset.addGestureRecognizer(tapPlayGesture)
        boatAsset.isUserInteractionEnabled = true
        boatAsset.accessibilityLabel = "Barco"
        boatAsset.accessibilityHint = "Clique para som de remada"
        boatAsset.translatesAutoresizingMaskIntoConstraints = false
        boatAsset.isAccessibilityElement = true
        return boatAsset
    }()


    lazy var coconutTreeAsset: SKView = {
        let coconutTreeAsset = SKView()
        coconutTreeAsset.backgroundColor = .clear
        let scene = SKScene()
        scene.backgroundColor = .clear
        let no = Node(animation: .treeOff)
        scene.addChild(no)
        coconutTreeAsset.presentScene(scene)
        coconutTreeAsset.translatesAutoresizingMaskIntoConstraints = false
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCoconutTreeAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        coconutTreeAsset.addGestureRecognizer(tapPlayGesture)
        coconutTreeAsset.isUserInteractionEnabled = true
        coconutTreeAsset.accessibilityLabel = "Coqueiro"
        coconutTreeAsset.accessibilityHint = "Clique para som de vento"
        coconutTreeAsset.translatesAutoresizingMaskIntoConstraints = false
        coconutTreeAsset.isAccessibilityElement = true
        return coconutTreeAsset
    }()

    lazy var shellAsset: SKView = {
        let shellAsset = SKView()
        shellAsset.backgroundColor = .clear
        let scene = SKScene()
        scene.backgroundColor = .clear
        let no = Node(animation: .shellOn)
        scene.addChild(no)
        shellAsset.presentScene(scene)
        shellAsset.translatesAutoresizingMaskIntoConstraints = false
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapShellAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        shellAsset.addGestureRecognizer(tapPlayGesture)
        shellAsset.accessibilityLabel = "Caranguejo em movimento entrando na concha"
        shellAsset.accessibilityHint = "Clique para som de caranguejo"
        shellAsset.translatesAutoresizingMaskIntoConstraints = false
        shellAsset.isAccessibilityElement = true
        shellAsset.isUserInteractionEnabled = true
        return shellAsset
    }()

    lazy var starAsset: SKView = {
        let starAsset = SKView()
        starAsset.backgroundColor = .clear
        let scene = SKScene()
        scene.backgroundColor = .clear
        let no = Node(animation: .starOff)
        scene.addChild(no)
        starAsset.presentScene(scene)
        starAsset.translatesAutoresizingMaskIntoConstraints = false
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapStarAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        starAsset.addGestureRecognizer(tapPlayGesture)
        starAsset.accessibilityLabel = "Estrela do mar"
        starAsset.accessibilityHint = "Clique para som de estrela do mar"
        starAsset.translatesAutoresizingMaskIntoConstraints = false
        starAsset.isUserInteractionEnabled = true
        starAsset.isAccessibilityElement = true
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
        
        infoButton.accessibilityValue = isPlaying ? "Desligado" : "Ligado"
        soundButton.accessibilityValue = isPlaying ? "Desligado" : "Ligado"
        starAsset.accessibilityValue = isPlaying ? "Desligado" : "Ligado"
        shellAsset.accessibilityValue = isPlaying ? "Desligado" : "Ligado"
        boatAsset.accessibilityValue = isPlaying ? "Desligado" : "Ligado"
        oceanAsset.accessibilityValue = isPlaying ? "Ligado" : "Desligado"
        coconutTreeAsset.accessibilityValue = isPlaying ? "Desligado" : "Ligado"
        
    }

    @objc func didTapCoconutTreeAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapCoconutAsset()
    }

    @objc func didTapBoatAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapBoatAsset()
    }

    @objc func didTapseagullsAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapseagullsAsset()
    }


    @objc func didTapStarAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapStarAsset()
    }

    @objc func didTapShellAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapShellAsset()
    }
}

extension BeachView: ViewCodingProtocol {
    func setupHierarchy() {
        addSubview(backgroundImageView)
        addSubview(infoButton)
        addSubview(soundButton)
        addSubview(sunAsset)
        addSubview(oceanAsset)
        addSubview(coconutTreeAsset)
        addSubview(boatAsset)
        addSubview(starAsset)
        addSubview(shellAsset)
        addSubview(seagullsAsset)
        addSubview(infoButtonScreen)
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
        seagullsAssetConstraints()
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
    
    func infoButtonScreenConstraints() {
        NSLayoutConstraint.activate([
            infoButtonScreen.topAnchor.constraint(equalTo: topAnchor),
            infoButtonScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.10),
            infoButtonScreen.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.10),
            infoButtonScreen.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.10)
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
            boatAsset.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            boatAsset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            boatAsset.trailingAnchor.constraint(equalTo: starAsset.trailingAnchor),
            boatAsset.topAnchor.constraint(equalTo: centerYAnchor, constant: frame.height * -0.15)
        ])
    }

    func coconutTreeAssetConstraints() {
        NSLayoutConstraint.activate([
            coconutTreeAsset.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),
            coconutTreeAsset.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.30),
            coconutTreeAsset.centerXAnchor.constraint(equalTo: sunAsset.centerXAnchor),
            coconutTreeAsset.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: frame.height * -0.06)
        ])
    }

    func shellAssetConstrainst() {
        NSLayoutConstraint.activate([
            shellAsset.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),
            shellAsset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.30),
            shellAsset.trailingAnchor.constraint(equalTo: boatAsset.leadingAnchor, constant: frame.width * 0.17),
            shellAsset.bottomAnchor.constraint(equalTo: bottomAnchor, constant: frame.height * -0.10)
            ])
    }

    func starAssetConstraints() {
        NSLayoutConstraint.activate([
            starAsset.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.20),
            starAsset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.20),
            starAsset.trailingAnchor.constraint(equalTo: trailingAnchor, constant: frame.width * -0.05),
            starAsset.bottomAnchor.constraint(equalTo: coconutTreeAsset.bottomAnchor, constant: frame.width * 0.08)
        ])
    }

    func seagullsAssetConstraints() {
        NSLayoutConstraint.activate([
            seagullsAsset.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.15),
            seagullsAsset.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            seagullsAsset.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            seagullsAsset.trailingAnchor.constraint(equalTo: trailingAnchor, constant: frame.height * -0.05),
        ])
    }


}
 /*
  "Quiet tem uma tela colorida onde os elementos são praianos, onde na parte superior esquerda da tela é composta por um sol em um ceu azulado e logo em seguida na partte direita superior é composta por gaivotas voando livremente, abaixo esta o oceano em movimento com ondas que vem e vão e um barco em movimento, na parte de baixo do lado esquerda há um coqueiro com suas folhas em movimento e logo em seguida na parte direita há um Caranguejo em movimento entrando na concha e uma estrela do mar. Explore, respire e relaxe "
  */
