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
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background")
        let backgroundView = UIImageView(image: backgroundImage)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
    
        return backgroundView
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
        
    func playHaptics() {
        HapticsManager.shared.vibrate(for: .success)
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.addSubview(backgroundImageView)
        self.addSubview(oceanAsset)
        
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
            self.oceanAsset.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 270),
            self.oceanAsset.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.4),
            self.oceanAsset.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
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
