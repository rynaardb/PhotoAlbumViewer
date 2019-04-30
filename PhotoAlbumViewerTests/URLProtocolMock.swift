//  URLProtocolMock.swift

import Foundation

class URLProtocolMock: URLProtocol {
    static var testURLs = [URL?: Data]()

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let url = request.url,
            let data = URLProtocolMock.testURLs[url] {

            self.client?.urlProtocol(self, didLoad: data)

            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)

            self.client?.urlProtocol(self, didReceive: response!, cacheStoragePolicy: .notAllowed)
        }

        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { }
}
