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
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aqui será o conteúdo"
        label.textColor = .darkGray
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.titleLabel)

        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
