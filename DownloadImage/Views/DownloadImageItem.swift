//
//  DownloadImageItem.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/24/24.
//

import SwiftUI

struct DownloadImageItem: View {
    let model: PhotoModel
    
    var body: some View {
        HStack {
            DownloadImageItemImageView(imageUrl: model.url, key: "\(model.id)")
            VStack {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
        }
    }
}

#Preview {
    DownloadImageItem(model: PhotoModel(albumId: 1, id: 1, title: "Wow!", url: "https://eli.thegreenplace.net/images/2021/gopherplug.png", thumbnailUrl: "https://eli.thegreenplace.net/images/2021/gopherplug.png"))
        .padding()
        .previewLayout(.sizeThatFits)
}
