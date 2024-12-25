//
//  PhotoModelCacheManager.swift
//  DownloadImage
//
//  Created by Alex Tran on 12/25/24.
//

import Foundation
import SwiftUI

class PhotoModelCacheManager {
    static let instance = PhotoModelCacheManager()
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 200
        return cache
    }()
    
    private init() {}
    
    func add(name: String, image: UIImage) {
        photoCache.setObject(image, forKey: name as NSString)
    }
    
    func delete(name: String) {
        photoCache.removeObject(forKey: name as NSString)
    }
    
    func get(name: String) -> UIImage? {
        return photoCache.object(forKey: name as NSString)
    }
}
