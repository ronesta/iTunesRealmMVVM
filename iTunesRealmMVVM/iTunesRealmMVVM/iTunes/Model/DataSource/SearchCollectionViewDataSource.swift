//
//  SearchCollectionViewDataSource.swift
//  iTunesRealmMVVM
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import Foundation
import UIKit

final class SearchCollectionViewDataSource: NSObject, SearchDataSourceProtocol {
    var viewModel: SearchViewModelProtocol?
    var storageManager: StorageManagerProtocol?

    init(viewModel: SearchViewModelProtocol?,
         storageManager: StorageManagerProtocol?
    ) {
        self.viewModel = viewModel
        self.storageManager = storageManager
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.getAlbumsCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AlbumCollectionViewCell.id,
            for: indexPath)
                as? AlbumCollectionViewCell else {
            return UICollectionViewCell()
        }

        guard let album = viewModel?.getAlbum(at: indexPath.item) else {
            return UICollectionViewCell()
        }

        guard let imageData = storageManager?.fetchImageData(forImageId: Int(album.artistId)),
              let image = UIImage(data: imageData) else {
            return cell
        }

        let viewModel = AlbumCellViewModel(album: album, image: image)

        cell.configure(with: viewModel)

        return cell
    }
}
