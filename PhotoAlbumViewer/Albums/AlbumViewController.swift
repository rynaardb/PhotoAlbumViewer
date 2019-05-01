//  AlbumViewController.swift

import UIKit

private let reuseIdentifier = "AlbumCell"

class AlbumViewController: UICollectionViewController {

    weak var coordinator: MainCoordinator?
    private var albums = [Album]()

    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }()

    // MARK: Initializers

    convenience init() {
        self.init(albums: [Album]())
    }

    init(albums: [Album]) {
        self.albums = albums
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(AlbumCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.collectionView.backgroundColor = UIColor(hue: 0.63, saturation: 0.09, brightness: 0.19, alpha: 1.00)
        self.title = "Albums"
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let album = albums[indexPath.row]
        let viewModel = AlbumViewModel(model: album)

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlbumCell
        cell.viewModel = viewModel
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = self.albums[indexPath.row]

        self.coordinator?.showPhotosForAlbum(album)
    }
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
