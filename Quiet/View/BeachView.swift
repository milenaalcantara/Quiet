//
//  BeachView.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 08/09/22.
//

import UIKit
import AVFoundation
import Lottie

protocol BeachViewDelegate: AnyObject {
    func didTapSoundButton() -> Bool
    func didTapInfoButton()
    func didTapOceanAsset()
    func didTapSunAsset()
    func didTapCoconutAsset()
}

class BeachView: UIView {
    
    weak var delegate: BeachViewDelegate?
    
    var player: AVAudioPlayer!
    var i = 0
    
    var isPlaying = false
    
    let soundOnImage: UIImage = {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 22)
        let icon = UIImage(systemName: "speaker.slash", withConfiguration: iconConfig)!.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        return icon
    }()
    
    let soundOffImage: UIImage = {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 22)
        let icon = UIImage(systemName: "speaker", withConfiguration: iconConfig)!.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        return icon
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .infoLight)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(tapInfoButton), for: .touchUpInside)
        return button
    }()
    
    lazy var soundButton: UIButton = {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 22)
        let icon = UIImage(systemName: "speaker.slash", withConfiguration: iconConfig)?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(tapSoundButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var estrelaAsset: UIImageView = {
        let estrelaView = UIImageView(image: UIImage (named: "estrela"))
        estrelaView.translatesAutoresizingMaskIntoConstraints = false
        return estrelaView
    }()
    
    lazy var sunAsset: UIImageView = {
       let solView = UIImageView(image: UIImage(named: "sol"))
        solView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(tapSunAction(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1

        solView.addGestureRecognizer(tapPlayGesture)
        solView.isUserInteractionEnabled = true
        
        return solView
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
        
        return conchaView
    }()
    
    lazy var barcoAsset : UIImageView = {
        let barcoView = UIImageView(image: UIImage(named: "barco"))
        barcoView.translatesAutoresizingMaskIntoConstraints = false
        
        return barcoView
    }()
    
    lazy var oceanAsset: LottieAnimationView = {
        let oceanView: LottieAnimationView
        oceanView = .init(name: "ocean-gradient")
        oceanView.loopMode = .loop
        oceanView.play()
        oceanView.contentMode = .scaleToFill
        oceanView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(tapOceanAction(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        
        oceanView.addGestureRecognizer(tapPlayGesture)
        oceanView.isUserInteractionEnabled = true
        
        return oceanView
    }()
    
    lazy var coconutAsset: LottieAnimationView = {
        let coqueiroView: LottieAnimationView
        coqueiroView = .init(name: "coqueiro")
        coqueiroView.loopMode = .loop
        coqueiroView.play()
        coqueiroView.contentMode = .scaleToFill
        coqueiroView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(tapCoqueiroAction(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1
        
        coqueiroView.addGestureRecognizer(tapPlayGesture)
        coqueiroView.isUserInteractionEnabled = true
        
        return coqueiroView
    }()
    
    @objc func tapOceanAction(_ gesture: UITapGestureRecognizer) {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        delegate?.didTapOceanAsset()
    }
        
    @objc func tapSunAction(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapSunAsset()
    }
    
    @objc func tapCoqueiroAction(_ gesture: UITapGestureRecognizer) {
        delegate?.didTapCoconutAsset()
    }
    
    @objc func tapSoundButtonAction(_ gesture: UITapGestureRecognizer) {
        let isPlaying = delegate?.didTapSoundButton()
        
        if isPlaying! {
            soundButton.setImage(soundOnImage, for: .normal)
        } else {
            soundButton.setImage(soundOffImage, for: .normal)
        }
    }
    
    @objc func tapInfoButton() {
        delegate?.didTapInfoButton()
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.addSubview(backgroundImageView)
        self.addSubview(oceanAsset)
        self.addSubview(sunAsset)
        self.addSubview(conchaAsset)
        self.addSubview(barcoAsset)
        self.addSubview(coconutAsset)
        self.addSubview(estrelaAsset)
        self.addSubview(soundButton)
        self.addSubview(infoButton)
        
        configureContraints()
    }

    required init?(coder: NSCoder) {
       fatalError()
    }
    
    func configureContraints() {
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.oceanAsset.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.oceanAsset.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 305),
            self.oceanAsset.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.4),
            self.oceanAsset.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width+10),
            
            self.sunAsset.bottomAnchor.constraint(equalTo: oceanAsset.topAnchor, constant: -80 ),
            self.sunAsset.heightAnchor.constraint(equalToConstant: 140),
            self.sunAsset.widthAnchor.constraint(equalToConstant: 150),
            self.sunAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.oceanAsset.bottomAnchor.constraint(equalTo: conchaAsset.topAnchor, constant: -70),
            self.conchaAsset.heightAnchor.constraint(equalToConstant: 30),
            self.conchaAsset.widthAnchor.constraint(equalToConstant: 30),
            self.conchaAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            
            self.barcoAsset.bottomAnchor.constraint(equalTo: oceanAsset.topAnchor, constant: 50 ),
            self.barcoAsset.heightAnchor.constraint(equalToConstant: 80),
            self.barcoAsset.widthAnchor.constraint(equalToConstant: 80),
            self.barcoAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            
            self.oceanAsset.bottomAnchor.constraint(equalTo: coconutAsset.topAnchor, constant: 130),
            self.coconutAsset.heightAnchor.constraint(equalToConstant: 250),
            self.coconutAsset.widthAnchor.constraint(equalToConstant: 178),
            self.coconutAsset.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 40),
            
            self.oceanAsset.bottomAnchor.constraint(equalTo: estrelaAsset.topAnchor, constant: -40),
            self.estrelaAsset.heightAnchor.constraint(equalToConstant: 30),
            self.estrelaAsset.widthAnchor.constraint(equalToConstant: 30),
            self.estrelaAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 160),
            
            self.soundButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            self.soundButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.soundButton.widthAnchor.constraint(equalToConstant: 40),
            self.soundButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 76),
            self.infoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoButton.widthAnchor.constraint(equalToConstant: 40),
            self.infoButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}

/*
 *       button.backgroundColor = .white
 * button.setImage(icon, for: .normal)
//        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        button.layer.cornerRadius = 20
//        button.layer.masksToBounds = false
//        button.layer.shadowColor = UIColor.gray.cgColor
//        button.layer.shadowOffset = CGSize(width: 2, height: 2)
//        button.layer.shadowOpacity = 0.25
//        button.layer.shadowRadius = 0.0
//        button.addTarget(self, action: #selector(tapSoundButtonAction), for: .touchUpInside)
 */
