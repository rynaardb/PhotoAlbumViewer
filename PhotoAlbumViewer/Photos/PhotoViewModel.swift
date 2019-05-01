// PhotoViewModel.swift

import Foundation

struct PhotoViewModel {
    private let model: Photo!

    var photoIdString: String {
        return "Photo ID: \(model.id)"
    }

    var title: String {
        return model.title
    }

    var thumbnailURL: URL? {
        return URL(string: model.thumbnailUrl)
    }

    var imageURL: URL? {
        return URL(string: model.url)
    }

    init(model: Photo) {
        self.model = model
    }
}
