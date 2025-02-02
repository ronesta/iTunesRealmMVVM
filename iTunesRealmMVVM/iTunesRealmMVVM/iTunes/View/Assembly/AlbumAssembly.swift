//
//  AlbumAssembly.swift
//  iTunesRealmMVVM
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import Foundation
import UIKit

struct AlbumAssembly {
    func build(with album: RealmAlbum) -> UIViewController {
        let storageManager = StorageManager()

        let albumViewModel = AlbumViewModel(storageManager: storageManager,
                                            album: album
        )
        let albumViewController = AlbumViewController(viewModel: albumViewModel)

        return albumViewController
    }
}
