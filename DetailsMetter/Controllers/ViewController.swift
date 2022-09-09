//
//  ViewController.swift
//  DetailsMetter
//
//  Created by Milena Lima de Alcântara on 06/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground // se estiver no dark, fundo preto, se estiver no light, fundo branco
    }
    
    override func loadView() { // carrega a view criada programaticamente para ser mostrada
        let beachScreen = BeachView() // inicialização da view BeachView
        self.view = beachScreen // atribuindo a BeachView a nossa view view controller para ser mostrada no app
    }

}

