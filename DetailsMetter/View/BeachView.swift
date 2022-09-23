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
    func didTapOceanAsset()
    func didTapSunAsset()
    func didTapCoconutAsset()
}

class BeachView: UIView {
    
    weak var delegate: BeachViewDelegate?
    
    var player: AVAudioPlayer!
    var i = 0
    
    var isPlaying = false
    
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
    
    lazy var oceanAsset: AnimationView = {
        let oceanView: AnimationView
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
    
    lazy var coconutAsset: AnimationView = {
        let coqueiroView: AnimationView
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
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.addSubview(backgroundImageView)
        self.addSubview(oceanAsset)
        self.addSubview(sunAsset)
        self.addSubview(conchaAsset)
        self.addSubview(barcoAsset)
        self.addSubview(coconutAsset)
        
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
            
        ])
    }
}
