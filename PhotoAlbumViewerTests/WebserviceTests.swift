//  WebserviceTests.swift

import XCTest
@testable import PhotoAlbumViewer

class WebserviceTests: XCTestCase {
    var webservice: Webservice!

    override func setUp() {
        super.setUp()

        let albumsFixtureURL = Bundle(for: type(of: self)).url(forResource: "albums", withExtension: "json")!
        let albumsURL = URL(string: "https://jsonplaceholder.typicode.com/albums")

        URLProtocolMock.testURLs = try! [albumsURL: Data(contentsOf: albumsFixtureURL)]

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        webservice = Webservice(session: URLSession(configuration: config))
    }

    func testLoadResource() {
        let resource = Resource<[Album]>(path: "/albums")
        
        let exp = expectation(description: "Load albums resource")

        webservice.load(resource: resource) { result in
            exp.fulfill()

            switch result {
            case .success(let albums):
                XCTAssert(albums?.count == 5)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }

        wait(for: [exp], timeout: 1.0)
    }
}
