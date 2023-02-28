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
        self.view.backgroundColor = .systemBackground // se estiver no dark, fundo preto, se estiver no light, fundo         
    }
}

extension BeachViewController: BeachViewDelegate {
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
            let no = Node(animation: .treeOff)
            beachView.coconutTreeAsset.scene?.removeAllChildren()
            beachView.coconutTreeAsset.scene?.addChild(no)
        } else {
            playSound(fileName: "wind")
            isPlayingCoconut = true
            let no = Node(animation: .treeBreath)
            beachView.coconutTreeAsset.scene?.removeAllChildren()
            beachView.coconutTreeAsset.scene?.addChild(no)
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
