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
        title = "Informações"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarItem()
        view.backgroundColor = .systemBackground
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

//enum LinkOptions: String, CaseIterable {
//    case zapsplat = "Zapsplat"
//    case pixabay = "Pixabay"
//
//    var url: String {
//        switch self {
//        case .zapsplat:
//            return "https://www.zapsplat.com/"
//        case .pixabay:
//            return "https://pixabay.com/"
//        }
//    }
//}
