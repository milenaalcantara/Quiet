//
//  BeachView.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 08/09/22.
//

import UIKit
import AVFoundation
import Lottie

class BeachView: UIView {
    
    var player: AVAudioPlayer!
    var i = 0
    
    var isPlaying = false
    
    lazy var solAsset: UIImageView = {
       let solView = UIImageView(image: UIImage(named: "sol"))
        solView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let tapPlayGesture = UITapGestureRecognizer(target: self, action: #selector(tapSunAction(_:)))
        tapPlayGesture.numberOfTapsRequired = 1
        tapPlayGesture.numberOfTouchesRequired = 1

        solView.addGestureRecognizer(tapPlayGesture)
        solView.isUserInteractionEnabled = true
//
        return solView
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background2")
        let backgroundView = UIImageView(image: backgroundImage)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
    
        return backgroundView
    }()
    
    lazy var conchaAsset : UIImageView = {
        let conchaView = UIImageView(image: UIImage(named: "concha"))
        conchaView.translatesAutoresizingMaskIntoConstraints = false
        
        return conchaView
    }()
    
//    lazy var starAsset : UIImageView = {
//        let starView = UIImageView(image: UIImage(named: "star2"))
//        starView.translatesAutoresizingMaskIntoConstraints = false
//
//        return starView
//    }()
    
    lazy var barcoAsset : UIImageView = {
        let barcoView = UIImageView(image: UIImage(named: "barco"))
        barcoView.translatesAutoresizingMaskIntoConstraints = false
        
        return barcoView
    }()
    
    lazy var oceanAsset: AnimationView = {
        let oceanView: AnimationView
        oceanView = .init(name: "ocean")
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
    
    lazy var coqueiroAsset: AnimationView = {
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
        playHaptics()
        if isPlaying {
            playSound(fileName: "sea", extensionType: "mp3", play: false)
            isPlaying = false
        } else {
            playSound(fileName: "sea", extensionType: "mp3", play: true)
            isPlaying = true
        }
    }
        
    
    
    @objc func tapSunAction(_ gesture: UITapGestureRecognizer) {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        playHaptics()
        if isPlaying {
            playSound(fileName: "seagulls", extensionType: "mp3", play: false)
            isPlaying = false
        } else {
            playSound(fileName: "seagulls", extensionType: "mp3", play: true)
            isPlaying = true
        }
    }
    
    @objc func tapCoqueiroAction(_ gesture: UITapGestureRecognizer) {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        playHaptics()
        if isPlaying {
            playSound(fileName: "wind", extensionType: "mp3", play: false)
            isPlaying = false
        } else {
            playSound(fileName: "wind", extensionType: "mp3", play: true)
            isPlaying = true
        }
    }
    
    
    func playHaptics() {
        HapticsManager.shared.vibrate(for: .success)
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.addSubview(backgroundImageView)
        self.addSubview(oceanAsset)
        self.addSubview(solAsset)
        self.addSubview(conchaAsset)
//        self.addSubview(starAsset)
        self.addSubview(barcoAsset)
        self.addSubview(coqueiroAsset)
        
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
            self.oceanAsset.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            self.solAsset.bottomAnchor.constraint(equalTo: oceanAsset.topAnchor, constant: -80 ),
//            self.solAsset.centerXAnchor.constraint(equalTo: self.centerXAnchor ),
            self.solAsset.heightAnchor.constraint(equalToConstant: 140),
            self.solAsset.widthAnchor.constraint(equalToConstant: 150),
            self.solAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.oceanAsset.bottomAnchor.constraint(equalTo: conchaAsset.topAnchor, constant: -70),
            self.conchaAsset.heightAnchor.constraint(equalToConstant: 30),
            self.conchaAsset.widthAnchor.constraint(equalToConstant: 30),
            self.conchaAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            
//            self.oceanAsset.bottomAnchor.constraint(equalTo: starAsset.topAnchor, constant: -90),
//            self.starAsset.heightAnchor.constraint(equalToConstant: 25),
//            self.starAsset.widthAnchor.constraint(equalToConstant: 25),
//            self.starAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            
            self.barcoAsset.bottomAnchor.constraint(equalTo: oceanAsset.topAnchor, constant: 50 ),
            self.barcoAsset.heightAnchor.constraint(equalToConstant: 80),
            self.barcoAsset.widthAnchor.constraint(equalToConstant: 80),
            self.barcoAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            
            
            self.oceanAsset.bottomAnchor.constraint(equalTo: coqueiroAsset.topAnchor, constant: 130),
            self.coqueiroAsset.heightAnchor.constraint(equalToConstant: 250),
            self.coqueiroAsset.widthAnchor.constraint(equalToConstant: 178),
            self.coqueiroAsset.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2),
            
        ])
    }
}

extension BeachView {
    func playSound(fileName: String, extensionType: String, play: Bool){
       guard let url = Bundle.main.url(forResource: fileName, withExtension: extensionType) else {
           return
       }
    
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            if play {
                player.play()
                player.numberOfLoops = -1
                
            } else if play == false{
                player.stop()
            }

        } catch let error {
            print(error.localizedDescription)

        }
    }
}

// lazy var starAsset: AnimationView = {
//        let animatedView: AnimationView
//        animatedView = .init(name: "starfish")
//        animatedView.frame = self.bounds
//        animatedView.translatesAutoresizingMaskIntoConstraints = false
//        animatedView.loopMode = .loop
//        animatedView.play()
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(starTapAction(_:)))
//        tapGesture.numberOfTapsRequired = 1
//        tapGesture.numberOfTouchesRequired = 1
//
//        animatedView.addGestureRecognizer(tapGesture)
//        animatedView.isUserInteractionEnabled = true
//        return animatedView
//    }()
//
//    @objc func starTapAction(_ gesture: UITapGestureRecognizer) {
//        print("star clicked")
//
//        // coloca aqui irá acontecer quando o usuário clicar no elemento x
//    }

//    lazy var createButton: UIButton = {
//         let button = UIButton(type: .system)
//         button.translatesAutoresizingMaskIntoConstraints = false
//         button.setTitle("Botão", for: .normal)
//         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//         button.addTarget(self, action: #selector(buttonActions), for: .touchUpInside)
//         button.setTitleColor(.black, for: .normal)
//         button.clipsToBounds = true
//         button.layer.borderWidth = 1
//         button.layer.borderColor = UIColor.black.cgColor
//         button.layer.cornerRadius = 8
//
//       return button
//
//     }()
    
    //    @objc func buttonActions() {
    //        playSound(fileName: "success", extensionType: "mp3", play: true)
    //        playHaptics()
    //    }
