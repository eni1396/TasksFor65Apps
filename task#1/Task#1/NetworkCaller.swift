//
//  ImageFetcher.swift
//  Task#1
//
//  Created by Nikita Entin on 02.07.2021.
//

import UIKit

final class NetworkCaller {
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                cell.imageView?.image = image
                cell.setNeedsLayout()
                self.imageCache.setObject(image, forKey: url as AnyObject)
            }
        }.resume()
    }
    
    func fetchImage(for indexPath: IndexPath) -> URL? {
        let urlString = "http://placehold.it/375x150?text=\(indexPath.row + 1)"
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
}
