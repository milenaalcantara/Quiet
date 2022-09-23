//
//  ViewController.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 06/09/22.
//

import UIKit
import AVFoundation

class BeachViewController: UIViewController {
    private var player: AVAudioPlayer!
//    private var isPlaying = false
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
        
        self.view.backgroundColor = .systemBackground // se estiver no dark, fundo preto, se estiver no light, fundo branco
    }
}

extension BeachViewController: BeachViewDelegate {
    func didTapOceanAsset() {
        // coloca aqui irá acontecer quando o usuário clicar no elemento x
        playHaptics()
        if isPlayingOcean {
            playSound(fileName: "sea", extensionType: "mp3", play: false)
            isPlayingOcean = false
        } else {
            playSound(fileName: "sea", extensionType: "mp3", play: true)
            isPlayingOcean = true
        }
    }
    
    func didTapSunAsset() {
        playHaptics()
        if isPlayingSun {
            playSound(fileName: "seagulls", extensionType: "mp3", play: false)
            isPlayingSun = false
        } else {
            playSound(fileName: "seagulls", extensionType: "mp3", play: true)
            isPlayingSun = true
        }
    }
    
    func didTapCoconutAsset() {
        playHaptics()
        if isPlayingCoconut {
            playSound(fileName: "wind", extensionType: "mp3", play: false)
            isPlayingCoconut = false
        } else {
            playSound(fileName: "wind", extensionType: "mp3", play: true)
            isPlayingCoconut = true
        }
    }
    
    func playHaptics() {
        HapticsManager.shared.vibrate(for: .success)
    }
}

extension BeachViewController {
    func playSound(fileName: String, extensionType: String, play: Bool){
       guard let url = Bundle.main.url(forResource: fileName, withExtension: extensionType) else {
           return
       }
    
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            print(String(player.numberOfChannels))
            
            guard let player = player else { return }

            if play {
                player.play()
                player.numberOfLoops = -1 //toca em loop infinito
            } else if play == false{
                player.stop()
            }

        } catch let error {
            print(error.localizedDescription)

        }
    }
}
