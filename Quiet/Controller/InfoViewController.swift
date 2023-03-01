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
//        print(infoView.aboutSection.aboutAppText.numberOfLines)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print(infoView.aboutAppText.numberOfLines)
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

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.textLabel?.text = LinkOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .label
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let linkOption: String = LinkOptions.allCases[indexPath.row].url
//        open(
//            URL(string: linkOption),
//            [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly],
//            nil
//        )
    }
}

enum LinkOptions: String, CaseIterable {
    case zapsplat = "Zapsplat"
    case pixabay = "Pixabay"

    var url: String {
        switch self {
        case .zapsplat:
            return "https://www.zapsplat.com/"
        case .pixabay:
            return "https://pixabay.com/"
        }
    }
}
