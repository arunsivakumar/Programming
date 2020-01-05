//
//  BuyCoordinator.swift
//  Coordinator
//
//  Created by Arun Sivakumar on 6/1/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation
import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishBuying() {
        parentCoordinator?.childDidFinish(self)
    }
}
