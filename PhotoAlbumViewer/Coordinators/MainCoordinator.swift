//
//  Webservice.swift
//  MainCoordinator.swift
//
//  Created by Rynaard Burger on 30.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController = UINavigationController()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isTranslucent = false
    }

    func start() {
        Webservice().load(resource: Album.allAlbums()) { result in
            switch result {
            case .success(let albums):
                if let albums = albums {
                    let mainVC = AlbumViewController(albums: albums)
                    mainVC.coordinator = self
                    self.navigationController.pushViewController(mainVC, animated: false)
                }
            case .failure(let error):
                print("Handle error: \(error.localizedDescription)")
            }
        }
    }
}
