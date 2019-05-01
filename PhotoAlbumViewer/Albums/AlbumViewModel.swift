//  AlbumViewController.swift

import Foundation

struct AlbumViewModel {
    private let model: Album!

    var title: String {
        return model.title
    }

    var numberOfPhotosString: String {
        return "\(model.photos?.count ?? 0) photos in album"
    }

    var previewPhotos: [Photo]? {
        guard let photos = model.photos else { return nil }

        return Array(photos[...2])
    }

    init(model: Album) {
        self.model = model
    }
}
