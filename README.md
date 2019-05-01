# PhotoAlbumViewer
A sample universal iOS application showing albums and photos using data from [JSONPlaceholder](https://jsonplaceholder.typicode.com).

## Prerequisites

* Xcode 10.2
* Swift 5

## UI

* The application uses UICollectionViewController to show albums and photos
* Auto Layout using layout anchors in code

## Networking / Parsing

* Lightweight URLSession-based networking API with generics support which is also easy to extend and test
* Uses the Decodable protocol for easy JSON decoding
* Uses the new Result type introduced in Swift 5
* URLProtocolMock for testing network requests

## Architecture

* MVVM
* Coordinators for navigation management

## Third-party libraries (using CocoaPods)

* [Kingfisher](https://github.com/onevcat/Kingfisher) for loading and caching images asynchronously 
