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
    
    lazy var conchaAsset : UIImageView = {
        let conchaView = UIImageView(image: UIImage(named: "concha"))
        conchaView.translatesAutoresizingMaskIntoConstraints = false
        
        return conchaView
    }()
    
    lazy var barcoAsset : UIImageView = {
        let barcoView = UIImageView(image: UIImage(named: "barco"))
        barcoView.translatesAutoresizingMaskIntoConstraints = false
        
        return barcoView
    }()
    
    
    lazy var oceanAsset: LottieAnimationView = {
        let oceanAsset: LottieAnimationView
        oceanAsset = .init(name: "ocean-gradient")
        oceanAsset.loopMode = .loop
        oceanAsset.play()
        oceanAsset.contentMode = .scaleToFill
        oceanAsset.translatesAutoresizingMaskIntoConstraints = false

        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOceanAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1

        oceanAsset.addGestureRecognizer(tapPlayGesture)
        oceanAsset.isUserInteractionEnabled = true

        return oceanAsset
    }()

    lazy var starAsset: UIImageView = {
        let starAsset = UIImageView(image: UIImage (named: "star"))
        starAsset.translatesAutoresizingMaskIntoConstraints = false
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

    @objc func didTapSunAsset(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapSunAsset()
    }

    @objc func didTapOceanAsset(_ gesture: UITapGestureRecognizer) {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        delegate?.didTapOceanAsset()
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
