//  MainCoordinator.swift

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

    func showPhotosForAlbum(_ album: Album) {
        Webservice().load(resource: Photo.photosForAlbum(albumId: album.id)) { result in
            switch result {
            case .success(let photos):
                if let photos = photos {
                    let photosVC = PhotosViewController(photos: photos)
                    photosVC.coordinator = self
                    self.navigationController.pushViewController(photosVC, animated: false)
                }
            case .failure(let error):
                print("Handle error: \(error.localizedDescription)")
            }
        }
    }
}
