//
//  BeachView.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 08/09/22.
//

import UIKit
import Lottie

class BeachView: UIView {
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "beachBackground")
        let backgroundView = UIImageView(image: backgroundImage)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
    
        return backgroundView
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
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.addSubview(backgroundImageView)
        self.addSubview(starAsset)
        
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
