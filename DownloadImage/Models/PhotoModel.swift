//
//  PhotoModel.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/24/24.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
