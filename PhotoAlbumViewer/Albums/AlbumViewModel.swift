//  AlbumViewController.swift

import Foundation

struct AlbumViewModel {
    private let model: Album!

    var title: String {
        return model.title
    }

    var numberOfPhotosString: String {
        return "Photos: 0"
    }

    init(model: Album) {
        self.model = model
    }
}
