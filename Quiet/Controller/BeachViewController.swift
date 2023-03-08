//
//  ViewController.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 06/09/22.
//

import UIKit
import AVFoundation
import SpriteKit

class BeachViewController: UIViewController {
    private var players = [URL:AVAudioPlayer]()
    private var duplicatePlayers = [AVAudioPlayer]()
    private var isPlayingStar = false
    private var isPlayingBackgroundSound = true
    private var isPlayingOcean = false
    private var isPlayingSun = false
    private var isPlayingCoconut = false
    private var isPlayingShell = false
    
    private let beachView = BeachView() // inicialização da view BeachView
    
    override func loadView() { // carrega a view criada programaticamente para ser mostrada
        beachView.delegate = self
        self.view = beachView // atribuindo a BeachView a nossa view view controller para ser mostrada no app
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground // se estiver no dark, fundo preto, se estiver no light, fundo         
    }
}

extension BeachViewController: BeachViewDelegate {
    func didTapShellAsset() {
        playHaptics()
        if isPlayingShell {
//            playSound(fileName: "seagulls")
            isPlayingShell = false
            let node = Node(animation: .shellOff)
            beachView.shellAsset.scene?.removeAllChildren()
            beachView.shellAsset.scene?.addChild(node)
        } else {
//            playSound(fileName: "seagulls")
            isPlayingShell = true
            let node = Node(animation: .shellOn)
            beachView.shellAsset.scene?.removeAllChildren()
            beachView.shellAsset.scene?.addChild(node)
        }
    }

    func didTapStarAsset() {
        playHaptics()
        if isPlayingStar {
//            playSound(fileName: "seagulls")
            isPlayingStar = false
            let node = Node(animation: .starOff)
//            playSound(fileName: "star")
            beachView.starAsset.scene?.removeAllChildren()
            beachView.starAsset.scene?.addChild(node)
        } else {
//            playSound(fileName: "seagulls")
            isPlayingStar = true
//            playSound(fileName: "star")

            let node = Node(animation: .starBreath)
            beachView.starAsset.scene?.removeAllChildren()
            beachView.starAsset.scene?.addChild(node)
        }
    }

    func didTapseagullsAsset() {
        playHaptics()
        if isPlayingSun {
            playSound(fileName: "seagulls")
            isPlayingSun = false
            let node = Node(animation: .seagullOff)
            beachView.seagullsAsset.scene?.removeAllChildren()
            beachView.seagullsAsset.scene?.addChild(node)
        } else {
            playSound(fileName: "seagulls")
            isPlayingSun = true
            let node = Node(animation: .seagullBreath)
            beachView.seagullsAsset.scene?.removeAllChildren()
            beachView.seagullsAsset.scene?.addChild(node)
        }
    }

    func didTapBoatAsset() {
        playHaptics()
        if isPlayingOcean {
            playSound(fileName: "ocean-teste")
            isPlayingOcean = false
            let node = Node(animation: .boatOff)
            beachView.boatAsset.scene?.removeAllChildren()
            beachView.boatAsset.scene?.addChild(node)
        } else {
            playSound(fileName: "ocean-teste")
            isPlayingOcean = true
            let node = Node(animation: .boatBreath)
            beachView.boatAsset.scene?.removeAllChildren()
            beachView.boatAsset.scene?.addChild(node)
        }
    }

    func didTapSoundButton() {
        playHaptics()
        if isPlayingBackgroundSound {
            playSound(fileName: "ambient")
            isPlayingBackgroundSound = false
            toggleSoundIcon(for: "speaker")
        } else {
            playSound(fileName: "ambient")
            isPlayingBackgroundSound = true
            toggleSoundIcon(for: "speaker.slash")
        }
    }
    
    func toggleSoundIcon(for iconName: String) {
        let iconConfig = UIImage.SymbolConfiguration(font: UIFont.preferredFont(forTextStyle: .title2))
        let icon = UIImage(
            systemName: iconName,
            withConfiguration: iconConfig)?.withTintColor(.darkGray, renderingMode: .alwaysOriginal
        ) 
        beachView.soundButton.setImage(icon, for: .normal)
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
            let node = Node(animation: .treeOff)
            beachView.coconutTreeAsset.scene?.removeAllChildren()
            beachView.coconutTreeAsset.scene?.addChild(node)
        } else {
            playSound(fileName: "wind")
            isPlayingCoconut = true
            let node = Node(animation: .treeBreath)
            beachView.coconutTreeAsset.scene?.removeAllChildren()
            beachView.coconutTreeAsset.scene?.addChild(node)
        }
        
    }
    
    func didTapInfoButton() {
        let infoViewController = InfoViewController()
        let navigator = UINavigationController(rootViewController: infoViewController)
        navigator.modalPresentationStyle = .fullScreen
        
        present(navigator, animated: true, completion: nil)
    }
    
    func playHaptics() {
        HapticsManager.shared.vibrateSelection()
    }
}

 // MARK: Audio Manager
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
