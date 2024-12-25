//
//  PhotoModelFileManager.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/25/24.
//

import Foundation
import SwiftUI
 
class PhotoModelFileManager {
    static let instance = PhotoModelFileManager()
    let folderName = "downloaded_photos"
    
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let folderPath = getFolderPath() else { return }
        
        if !FileManager.default.fileExists(atPath: folderName) {
            do {
                try FileManager.default.createDirectory(atPath: folderPath.path, withIntermediateDirectories: true)
                print("CREATED FOLDER")
            } catch let error {
                print(error)
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        guard let basePath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
               return nil
        }
       var folderPath = basePath
       folderPath.appendPathComponent(folderName)
       return folderPath
    }
    
    private func getImagePath(key: String) -> URL? {
        guard let folderPath = getFolderPath() else { return nil }
        return folderPath.appendingPathComponent("\(key).png")
    }
    
    func add(key: String, image: UIImage) {
        guard let data = image.pngData(),
              let imagePath = getImagePath(key: key) else { return }
        
        do {
            try data.write(to: imagePath)
        } catch let error {
            print("ERROR: \(error)")
        }
    }
    
    func get(key: String) -> UIImage? {
        guard let imagePath = getImagePath(key: key),
              FileManager.default.fileExists(atPath: imagePath.path) else { return nil }
        
        return UIImage(contentsOfFile: imagePath.path)
    }
}
