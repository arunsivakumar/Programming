//
//  BuyViewController.swift
//  Coordinator
//
//  Created by Arun Sivakumar on 5/1/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {

    weak var coordinator: BuyCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
}
