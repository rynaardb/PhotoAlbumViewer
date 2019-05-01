//  PhotosViewController.swift

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosViewController: UICollectionViewController {
    weak var coordinator: MainCoordinator?
    private var photos = [Photo]()
    var cellSize = CGSize.zero

    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }()

    // MARK: Initializers

    convenience init() {
        self.init(photos: [Photo]())
    }

    init(photos: [Photo]) {
        self.photos = photos
        super.init(collectionViewLayout:layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.collectionView.backgroundColor = Theme.Colors.darkGray1
        self.title = "Photos"
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photo = photos[indexPath.row]
        let viewModel = PhotoViewModel(model: photo)

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        cell.viewModel = viewModel

        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = self.photos[indexPath.row]

        self.coordinator?.showPhotoDetails(viewModel: PhotoViewModel(model: photo))
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
