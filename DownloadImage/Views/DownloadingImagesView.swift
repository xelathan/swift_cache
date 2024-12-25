//
//  DownloadingImagesView.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/24/24.
//

import SwiftUI

struct DownloadingImagesView: View {
    @StateObject private var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if vm.dataArray.isEmpty {
                    ProgressView()
                } else {
                    List {
                        ForEach(vm.dataArray, id: \.id) { model in
                            DownloadImageItem(model: model)
                        }
                    }
                }
            }.navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownloadingImagesView()
}
