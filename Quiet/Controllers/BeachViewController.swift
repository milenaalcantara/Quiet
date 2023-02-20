//
//  ViewController.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 06/09/22.
//

import UIKit
import AVFoundation
import Lottie

class BeachViewController: UIViewController {
    private var players = [URL:AVAudioPlayer]()
    private var duplicatePlayers = [AVAudioPlayer]()
    
    private var isPlayingBackgroundSound = true
    private var isPlayingOcean = false
    private var isPlayingSun = false
    private var isPlayingCoconut = false
    
    private let beachView = BeachView() // inicialização da view BeachView
    
    override func loadView() { // carrega a view criada programaticamente para ser mostrada
        beachView.delegate = self
        self.view = beachView // atribuindo a BeachView a nossa view view controller para ser mostrada no app
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageElements = [
            beachView.sunAssetWhite, beachView.boatAssetWhite, beachView.starAssetWhite, beachView.shellAssetWhite
        ]
        breathAnimation(images: imageElements)
        
        self.view.backgroundColor = .systemBackground // se estiver no dark, fundo preto, se estiver no light, fundo branco
    }
}



extension BeachViewController {
    
    func breathAnimation(images: [UIImageView]) {
        for element in images {
            UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse], animations: {
                UIView.setAnimationRepeatCount(.infinity)
                element.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)    // 1.5 times its normal size
                element.isHidden = false
            }){ (finished) in
                element.transform = CGAffineTransform.identity
            }
        }
    }
    
}

extension BeachViewController: BeachViewDelegate {
    func didTapStarAsset() {
        showLottieElement(lottie: self.beachView.explosionAsset, trigger: self.beachView.starAssetWhite)
    }
    
    func didTapShellAsset() {
        showLottieElement(lottie: self.beachView.musicAsset, trigger: self.beachView.shellAssetWhite)
    }
    
    func didTapBoatAsset() {
        showLottieElement(lottie: self.beachView.windAnimation, trigger: self.beachView.boatAssetWhite)
    }
    
    func showLottieElement(lottie: LottieAnimationView, trigger: UIImageView) {
        lottie.isHidden = false
        trigger.isHidden = true
        lottie.play { _ in
            lottie.isHidden = true
            trigger.isHidden = false
        }
    }
    
    func didTapSoundButton() {

    }
    
    func didTapOceanAsset() {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        playHaptics()
        if isPlayingOcean {
            playSound(fileName: "ocean-teste")
            isPlayingOcean = false
        } else {
            playSound(fileName: "ocean-teste")
            isPlayingOcean = true
        }
    }
    
    func didTapSunAsset() {
        playHaptics()
        if isPlayingSun {
            playSound(fileName: "seagulls")
            isPlayingSun = false
        } else {
            playSound(fileName: "seagulls")
            isPlayingSun = true
        }
    }
    
    func didTapCoconutAsset() {
        if isPlayingCoconut {
            playSound(fileName: "wind")
            isPlayingCoconut = false
            playHaptics()
        } else {
            playSound(fileName: "wind")
            isPlayingCoconut = true
        }
        
    }
    
    func didTapInfoButton() {
        let infoViewController = InfoViewController()
        let nav = UINavigationController(rootViewController: infoViewController)
        
        nav.modalPresentationStyle = .pageSheet
        
        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.large()]
        }
        
        present(nav, animated: true, completion: nil)
    }
    
    func playHaptics() {
        HapticsManager.shared.vibrateSelection()
    }
}

extension BeachViewController {
    func playSound(fileName: String){
        guard let soundURL = Bundle.main.url(forResource: fileName, withExtension: ".mp3")
        else {
           return
        }
        
        if let player = self.players[soundURL] {
            if !player.isPlaying {
                player.numberOfLoops = -1 //toca em loop infinito
                player.prepareToPlay()
                player.play()
                return
            } else if player.isPlaying {
                player.stop()
                return
            }
            createADuplicatedPlayer(soundURL: soundURL)
            return
        }
        
        createANewPlayer(soundURL: soundURL)
    }
    
    func createANewPlayer(soundURL: URL) {
        do{
            let player = try AVAudioPlayer(contentsOf: soundURL)
            players[soundURL] = player
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        } catch {
            print("Could not play sound file!")
        }
    }
    
    func createADuplicatedPlayer(soundURL: URL) {
        let newPlayer = try! AVAudioPlayer(contentsOf: soundURL)
        duplicatePlayers.append(newPlayer)
        newPlayer.numberOfLoops = -1
        newPlayer.prepareToPlay()
        newPlayer.play()
    }
}
