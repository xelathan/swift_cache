//
//  PhotoModelDataService.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/24/24.
//

import Foundation

class PhotoModelDataService {
    static let instance = PhotoModelDataService()
    
    private init() {}
    
    func downloadData() async -> [PhotoModel] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return [] }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            guard let urlResponse = urlResponse as? HTTPURLResponse,
                  urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 else { return [] }
            let decodedPhotoModels = try JSONDecoder().decode([PhotoModel].self, from: data)
            
            return decodedPhotoModels
        } catch let error {
            print(error)
            return []
        }
    }
}
