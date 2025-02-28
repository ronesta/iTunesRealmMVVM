//
//  SearchViewModelProtocol.swift
//  iTunesRealmMVVM
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import Foundation

protocol SearchViewModelProtocol {
    var albums: Observable<[RealmAlbum]> { get set }
    var searchHistory: [String] { get }

    func searchAlbums(with term: String)
    func getAlbumsCount() -> Int
    func getAlbum(at index: Int) -> RealmAlbum
}
