//
//  InfoViewController.swift
//  Quiet
//
//  Created by Milena Lima de Alcântara on 29/09/22.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let infoView = InfoView()
    
    override func loadView() {
        self.view = infoView
        title = "Sobre o Quiet"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarItem()
    }
    
    func configureNavigationBarItem() {
        let dismissButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark.circle"),
            style: .done,
            target: self,
            action: #selector(didTapDismissButton))
        dismissButton.tintColor = .darkGray
        self.navigationItem.rightBarButtonItem = dismissButton
    }
    
    @objc func didTapDismissButton() {
        dismiss(animated: true)
    }

}
