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
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background")
        let backgroundView = UIImageView(image: backgroundImage)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
    
        return backgroundView
    }()
    
    lazy var createButton: UIButton = {
         let button = UIButton(type: .system)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setTitle("Botão", for: .normal)
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
         button.addTarget(self, action: #selector(buttonActions), for: .touchUpInside)
         button.setTitleColor(.black, for: .normal)
         button.clipsToBounds = true
         button.layer.borderWidth = 1
         button.layer.borderColor = UIColor.black.cgColor
         button.layer.cornerRadius = 8
        
       return button
         
     }()
    
    lazy var starAsset: AnimationView = {
        let animatedView: AnimationView
        animatedView = .init(name: "starfish")
        animatedView.frame = self.bounds
        animatedView.loopMode = .loop
        animatedView.play()

        animatedView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        animatedView.addGestureRecognizer(tapGesture)
        animatedView.isUserInteractionEnabled = true
        
        return animatedView
    }()
    
    @objc func actionGesture(_ gesture: UITapGestureRecognizer) {
        print("star clicked")
        
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
    }
    
    lazy var oceanAsset: AnimationView = {
            let oceanView: AnimationView
            oceanView = .init(name: "ocean")
            oceanView.loopMode = .loop
            oceanView.play()
            oceanView.contentMode = .scaleToFill

            oceanView.translatesAutoresizingMaskIntoConstraints = false

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionsGesture(_:)))
            tapGesture.numberOfTapsRequired = 1
            tapGesture.numberOfTouchesRequired = 1

            oceanView.addGestureRecognizer(tapGesture)
            oceanView.isUserInteractionEnabled = true

            return oceanView
        }()
    @objc func actionsGesture(_ gesture: UITapGestureRecognizer) {
            print("ocean clicked")

            // coloca aqui irá acontecer quando o usuário clicar no elemento x
        }
    
    
    @objc func buttonActions() {
        playSound()
        playHaptics()
    }
    
    func playSound(){
            
            
           guard let url = Bundle.main.url(forResource: "success", withExtension: "mp3") else {
               return
           }
            
        
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                guard let player = player else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)

            }
        }
        
        func playHaptics() {
            
            HapticsManager.shared.vibrate(for: .success)
            
        }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.addSubview(backgroundImageView)
        self.addSubview(starAsset)
        self.addSubview(createButton)
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
            
            self.starAsset.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -30),
            self.starAsset.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.starAsset.heightAnchor.constraint(equalToConstant: 50),
            self.starAsset.widthAnchor.constraint(equalToConstant: 50),
            
            self.createButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                     self.createButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.oceanAsset.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.oceanAsset.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 310),
                        self.oceanAsset.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.4),
                        self.oceanAsset.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
    }
}
                            
extension UIImageView {
    static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
}
