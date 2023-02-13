//
//  OnbeardViewController.swift
//  Quiet
//
//  Created by Moyses Miranda do Vale Azevedo on 10/02/23.
//

import Foundation
import UIKit


class OnboardViewController: UIViewController {
    private var contentView = OnboardView()


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        view = contentView
        contentView.skipAction = nextView
    }
}


extension OnboardViewController {
    func nextView() {
        self.navigationController?.pushViewController(BeachViewController(), animated: false)
    }
}
