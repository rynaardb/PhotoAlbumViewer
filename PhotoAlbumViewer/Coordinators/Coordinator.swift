//
//  Webservice.swift
//  Coordinator.swift
//
//  Created by Rynaard Burger on 30.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.

import Foundation

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
