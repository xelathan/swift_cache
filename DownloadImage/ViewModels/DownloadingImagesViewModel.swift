//
//  DownloadingImagesViewModel.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/24/24.
//

import Foundation

class DownloadingImagesViewModel: ObservableObject {
    let photoModelDataService = PhotoModelDataService.instance
    
    @Published var dataArray: [PhotoModel] = []
    
    init() {
        Task.init { @MainActor in
            self.dataArray =  await photoModelDataService.downloadData()
        }
    }
}
