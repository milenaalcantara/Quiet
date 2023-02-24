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
    func didTapBoatAsset()
    func didTapStarAsset()
    func didTapShellAsset()
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
        return infoButton
    }()

    lazy var soundButton: UIButton = {
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 18)
        let symbol = UIImage(systemName: "speaker.slash",
                             withConfiguration: symbolConfig)?.withTintColor(.black, renderingMode: .alwaysOriginal
                             )

        let soundButton = UIButton(type: .system)
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        soundButton.setImage(symbol, for: .normal)
        soundButton.addTarget(self, action: #selector(didTapSoundButton), for: .touchUpInside)
        return soundButton
    }()

    lazy var sunAsset: UIImageView = {
        let image = UIImage(named: "sun")
        let sunAsset = UIImageView(image: image)
        sunAsset.translatesAutoresizingMaskIntoConstraints = false
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSunAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1

        sunAsset.addGestureRecognizer(tapPlayGesture)
        sunAsset.isUserInteractionEnabled = true

        return sunAsset
    }()
    
    lazy var sunAssetWhite: UIImageView = {
        let image = UIImage(named: "sun")?.withRenderingMode(.alwaysTemplate)
        let sunAsset = UIImageView(image: image)
        sunAsset.tintColor = UIColor.white
        sunAsset.isHidden = false
        sunAsset.translatesAutoresizingMaskIntoConstraints = false
        return sunAsset
    }()
    
    lazy var seagullAsset : LottieAnimationView = {
        let seagullAsset: LottieAnimationView
        seagullAsset = .init(name: "seagulls")
        seagullAsset.loopMode = .playOnce
        seagullAsset.play()
        seagullAsset.contentMode = .scaleToFill
        seagullAsset.translatesAutoresizingMaskIntoConstraints = false
        seagullAsset.isHidden = true
        return seagullAsset
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
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapStarAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        
        starAsset.addGestureRecognizer(tapPlayGesture)
        starAsset.isUserInteractionEnabled = true
        
        return starAsset
    }()
    
    lazy var starAssetWhite: UIImageView = {
        let starAsset = UIImageView(image: UIImage (named: "star")?.withRenderingMode(.alwaysTemplate))
        starAsset.translatesAutoresizingMaskIntoConstraints = false
        starAsset.tintColor = .white
        starAsset.isHidden = false
        return starAsset
    }()
    
    lazy var explosionAsset : LottieAnimationView = {
        let explosionAsset: LottieAnimationView
        explosionAsset = .init(name: "explosion")
        explosionAsset.loopMode = .playOnce
        explosionAsset.play()
        explosionAsset.contentMode = .scaleToFill
        explosionAsset.translatesAutoresizingMaskIntoConstraints = false
        explosionAsset.isHidden = true
        return explosionAsset
    }()

    lazy var boatAsset: UIImageView = {
        let boatAsset = UIImageView(image: UIImage(named: "boat"))
        boatAsset.translatesAutoresizingMaskIntoConstraints = false
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBoatAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        
        boatAsset.addGestureRecognizer(tapPlayGesture)
        boatAsset.isUserInteractionEnabled = true
        
        return boatAsset
    }()
    
    lazy var windAnimation: LottieAnimationView = {
        let windAsset: LottieAnimationView
        windAsset = .init(name: "wind")
        windAsset.loopMode = .playOnce
        windAsset.play()
        windAsset.contentMode = .scaleToFill
        windAsset.translatesAutoresizingMaskIntoConstraints = false
        windAsset.isHidden = true
        return windAsset
    }()
    
    lazy var boatAssetWhite: UIImageView = {
        let boatAsset = UIImageView(image: UIImage(named: "boat")?.withRenderingMode(.alwaysTemplate))
        boatAsset.translatesAutoresizingMaskIntoConstraints = false
        boatAsset.tintColor = .white
        return boatAsset
    }()


    lazy var shellAsset: UIImageView = {
        let shellAsset = UIImageView(image: UIImage(named: "shell"))
        shellAsset.translatesAutoresizingMaskIntoConstraints = false
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(didTapShellAsset(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        
        shellAsset.addGestureRecognizer(tapPlayGesture)
        shellAsset.isUserInteractionEnabled = true
        
        return shellAsset
    }()
    
    lazy var shellAssetWhite: UIImageView = {
        let shellAsset = UIImageView(image: UIImage(named: "shell")?.withRenderingMode(.alwaysTemplate))
        shellAsset.translatesAutoresizingMaskIntoConstraints = false
        shellAsset.tintColor = .white
        shellAsset.isHidden = false
        return shellAsset
    }()
    
    lazy var musicAsset : LottieAnimationView = {
        let musicAsset: LottieAnimationView
        musicAsset = .init(name: "music")
        musicAsset.loopMode = .playOnce
        musicAsset.play()
        musicAsset.contentMode = .scaleToFill
        musicAsset.translatesAutoresizingMaskIntoConstraints = false
        musicAsset.isHidden = true
        return musicAsset
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
    
    @objc func didTapBoatAsset (_ gesture: UITapGestureRecognizer) {
        delegate?.didTapBoatAsset()
    }
    
    @objc func didTapStarAsset (_ gesture: UITapGestureRecognizer) {
        delegate?.didTapStarAsset()
    }
    
    @objc func didTapShellAsset (_ gesture: UITapGestureRecognizer) {
        delegate?.didTapShellAsset()
    }
}

extension BeachView: ViewCodingProtocol {
    func setupHierarchy() {
        addSubview(backgroundImageView)
        addSubview(oceanAsset)
        addSubview(sunAssetWhite)
        addSubview(sunAsset)
        addSubview(shellAssetWhite)
        addSubview(shellAsset)
        addSubview(boatAssetWhite)
        addSubview(boatAsset)
        addSubview(windAnimation)
        addSubview(coconutTreeAsset)
        addSubview(starAssetWhite)
        addSubview(starAsset)
        addSubview(infoButton)
        addSubview(soundButton)
        addSubview(musicAsset)
        addSubview(explosionAsset)
        addSubview(seagullAsset)
    }

    func setupConstraints() {
        backgroundImageViewConstraints()
        oceanAssetConstraints()
        sunAssetConstraints()
        shellAssetConstrainst()
        boatAssetConstraints()
        windAssetConstraints()
        coconutTreeAssetConstraints()
        starAssetConstraints()
        infoButtonConstraints()
        soundButtonConstraints()
        musicAssetConstraints()
        explosionAssetConstraints()
        seagullAssetConstraints()
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
            
            sunAssetWhite.centerYAnchor.constraint(equalTo: sunAsset.centerYAnchor),
            sunAssetWhite.centerXAnchor.constraint(equalTo: sunAsset.centerXAnchor),
            sunAssetWhite.heightAnchor.constraint(equalToConstant: 140),
            sunAssetWhite.widthAnchor.constraint(equalToConstant: 150),
            
            
        ])
    }

    func shellAssetConstrainst() {
        NSLayoutConstraint.activate([
            shellAsset.heightAnchor.constraint(equalToConstant: 30),
            shellAsset.widthAnchor.constraint(equalToConstant: 30),
            shellAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            
            shellAssetWhite.centerYAnchor.constraint(equalTo: shellAsset.centerYAnchor),
            shellAssetWhite.centerXAnchor.constraint(equalTo: shellAsset.centerXAnchor),
            shellAssetWhite.heightAnchor.constraint(equalToConstant: 33),
            shellAssetWhite.widthAnchor.constraint(equalToConstant: 33),
            ])
    }

    func boatAssetConstraints() {
        NSLayoutConstraint.activate([
            boatAsset.bottomAnchor.constraint(equalTo: oceanAsset.topAnchor, constant: 50 ),
            boatAsset.heightAnchor.constraint(equalToConstant: 80),
            boatAsset.widthAnchor.constraint(equalToConstant: 80),
            boatAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            boatAssetWhite.centerYAnchor.constraint(equalTo: boatAsset.centerYAnchor),
            boatAssetWhite.centerXAnchor.constraint(equalTo: boatAsset.centerXAnchor),
            boatAssetWhite.heightAnchor.constraint(equalToConstant: 81),
            boatAssetWhite.widthAnchor.constraint(equalToConstant: 81),
        ])
    }
    
    func windAssetConstraints() {
        NSLayoutConstraint.activate([
            windAnimation.centerYAnchor.constraint(equalTo: boatAsset.centerYAnchor),
            windAnimation.leadingAnchor.constraint(equalTo: boatAsset.leadingAnchor, constant: -30),
            windAnimation.heightAnchor.constraint(equalToConstant: 70),
            windAnimation.widthAnchor.constraint(equalToConstant: 70)
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
        starAsset.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160),
        
        starAssetWhite.centerYAnchor.constraint(equalTo: starAsset.centerYAnchor),
        starAssetWhite.centerXAnchor.constraint(equalTo: starAsset.centerXAnchor),
        starAssetWhite.heightAnchor.constraint(equalToConstant: 33),
        starAssetWhite.widthAnchor.constraint(equalToConstant: 33),
        ])

    }
    
    func explosionAssetConstraints() {
        NSLayoutConstraint.activate([
            explosionAsset.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 625),
            explosionAsset.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 120),
            explosionAsset.heightAnchor.constraint(equalToConstant: 100),
            explosionAsset.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func musicAssetConstraints() {
        NSLayoutConstraint.activate([
            musicAsset.topAnchor.constraint(equalTo: shellAsset.bottomAnchor, constant: -105),
            musicAsset.leadingAnchor.constraint(equalTo: shellAsset.leadingAnchor, constant: -10),
            musicAsset.heightAnchor.constraint(equalToConstant: 80),
            musicAsset.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func seagullAssetConstraints() {
        NSLayoutConstraint.activate([
            seagullAsset.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 100),
            seagullAsset.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 120),
            seagullAsset.heightAnchor.constraint(equalToConstant: 200),
            seagullAsset.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
