// UIImageView + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIImageView {
    /// Расширение выполнения запроса по загрузке картинки
    /// - Parameter url: ссылка
    func downloaded(from url: URL) {
        let loadService = LoadImageService()
        let proxy = Proxy(loadService: loadService)

        proxy.loadImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                }
            case .failure:
                break
            }
        }

        //        URLSession.shared.dataTask(with: url) { data, response, error in
        //            guard
        //                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        //                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        //                let data = data, error == nil,
        //                let image = UIImage(data: data)
        //            else { return }
        //            DispatchQueue.main.async { [weak self] in
        //                self?.image = image
        //            }
        //        }.resume()
    }

    /// Расширение для проверки существования картинки
    /// - Parameter link: тип ссылки
    func downloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        var image: UIImage?
        if image != nil {
            self.image = image
        } else {
            downloaded(from: url)
        }
    }
}
