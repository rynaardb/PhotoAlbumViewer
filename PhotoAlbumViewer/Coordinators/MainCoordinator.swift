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
                let group = DispatchGroup()

                if let albums = albums {
                    var photoAlbums = [Album]()

                    for var album in albums {
                        group.enter()

                        DispatchQueue.global(qos: .background).async {
                            Webservice().load(resource: Photo.photosForAlbum(albumId: album.id), completion: { result in
                                switch result {
                                case .success(let photos):
                                    album.photos = photos
                                    photoAlbums.append(album)
                                    group.leave()
                                case .failure(let error):
                                    print("Handle error: \(error.localizedDescription)")
                                }
                            })
                        }
                    }

                    group.notify(queue: DispatchQueue.main) {
                        DispatchQueue.main.async {
                            let mainVC = AlbumViewController(albums: photoAlbums)
                            mainVC.coordinator = self
                            self.navigationController.pushViewController(mainVC, animated: false)
                        }
                    }
                }
            case .failure(let error):
                print("Handle error: \(error.localizedDescription)")
            }
        }
    }

    func showPhotosForAlbum(_ album: Album) {
        if let photos = album.photos {
            let photosVC = PhotosViewController(photos: photos)
            photosVC.coordinator = self
            self.navigationController.pushViewController(photosVC, animated: false)
        }
    }

    func showPhotoDetails(viewModel: PhotoViewModel) {
        let photoDetailsVC = PhotoDetailsViewController(viewModel: viewModel)
        photoDetailsVC.coordinator = self
        self.navigationController.pushViewController(photoDetailsVC, animated: false)
    }
}
