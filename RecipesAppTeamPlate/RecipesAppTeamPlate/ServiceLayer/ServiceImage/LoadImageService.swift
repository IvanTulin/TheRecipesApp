// LoadImageService.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сервис загрузки изображения
class LoadImageService: LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping HandlerImage) {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil

        let session = URLSession(configuration: configuration)
        session.dataTask(with: url) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    completion(.success(data))

                    completion(.failure(.invalidateData))

//                    if let image = UIImage(data: data) {
//                        completion(.success(image))
//                    } else {
//                        completion(.failure(.invalidateData))
//                    }
                case let .failure(error):
                    completion(.failure(.networkFailure(error)))
                }
            }
        }.resume()
    }
}
