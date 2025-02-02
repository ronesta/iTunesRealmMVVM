//
//  AlbumViewModel.swift
//  iTunesRealmMVVM
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import Foundation
import UIKit

final class AlbumViewModel: AlbumViewModelProtocol {
    var storageManager: StorageManagerProtocol?

    let albumImage: Observable<UIImage?> = Observable(nil)
    let albumName: Observable<String?> = Observable(nil)
    let artistName: Observable<String?> = Observable(nil)
    let collectionPrice: Observable<String?> = Observable(nil)

    private var album: RealmAlbum

    init(storageManager: StorageManagerProtocol,
         album: RealmAlbum
    ) {
        self.storageManager = storageManager
        self.album = album
        setupBindings()
    }

    private func setupBindings() {
        albumName.value = album.collectionName
        artistName.value = album.artistName
        collectionPrice.value = "\(album.collectionPrice) $"

        guard let imageData = storageManager?.fetchImageData(forImageId: Int(album.artistId)),
              let image = UIImage(data: imageData) else {
            return
        }

        self.albumImage.value = image
    }
}
