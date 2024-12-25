//
//  DownloadImageItemImageViewModel.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/25/24.
//

import Foundation
import SwiftUI

class DownloadImageItemImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    
    let imageUrl: String
    let imageKey: String
    let manager = PhotoModelFileManager.instance
    
    init(imageUrl: String, key: String) {
        self.imageUrl = imageUrl
        self.imageKey = key
        
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            print("GOT CACHED IMAGE")
            self.image = savedImage
        } else {
            print("DOWNLOADING IMAGE")
            Task.init {
                await downloadImage()
            }
        }
    }
    
    func downloadImage() async {
        guard let url = URL(string: imageUrl) else { return }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            guard let urlResponse = urlResponse as? HTTPURLResponse,
                  urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self,
                let image = UIImage(data: data) else { return }
                self.image = image
                self.manager.add(key: self.imageKey, image: image)
            }
        } catch let error {
            print(error)
            return
        }
    }
}
