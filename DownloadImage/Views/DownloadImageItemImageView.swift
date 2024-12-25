//
//  DownloadImageItemImageView.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/25/24.
//

import SwiftUI

struct DownloadImageItemImageView: View {
    @StateObject private var vm: DownloadImageItemImageViewModel
    
    init(imageUrl: String, key: String) {
        _vm = StateObject(wrappedValue: DownloadImageItemImageViewModel(imageUrl: imageUrl,
                                                                       key: key))
    }
        
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(.circle)
            }  else {
                ProgressView()
            }
        }
    }
}

#Preview {
    DownloadImageItemImageView(imageUrl: "https://eli.thegreenplace.net/images/2021/gopherplug.png", key: "1")
}
