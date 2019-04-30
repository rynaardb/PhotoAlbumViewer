//  Photo.swift

import Foundation

struct Photo: Decodable {
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    static func photosForAlbum(albumId: Int) -> Resource<[Photo]> {
        return Resource<[Photo]>(path: "/photos", queryItems: [URLQueryItem(name: "albumId", value: "\(albumId)")])
    }
}
