// Proxy.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Посредник для загрузки изображений
class Proxy: LoadServiceProtocol {
    // MARK: - Constants

    private enum Constants {
        static let pathName = "Savedimage"
    }

    // MARK: - Private Constants

    private let loadService: LoadServiceProtocol
    private let fileManager = FileManager.default

    // MARK: - Initializers

    init(loadService: LoadServiceProtocol) {
        self.loadService = loadService
    }

    // MARK: - Puplic Properties

    func loadImage(url: URL, completion: @escaping HandlerImage) {
        let imageName = url.lastPathComponent
        print("url - \(url) \n imageName - \(imageName)")

        if let cashData = loadingFromCache(imageName: imageName) {
            completion(.success(cashData))
        } else {
            loadService.loadImage(url: url) { result in
                switch result {
                case let .success(data):
                    self.saveImage(imageName: imageName, image: data)
                    completion(.success(data))
                case .failure:
                    completion(.failure(.invalidateData))
                }
            }
        }

        // через Coredata

//        DispatchQueue.main.async { [weak self] in
//            guard let self = self else { return }
//            guard let urlString = try? String(contentsOf: url) else { return  }
//            if let data = ImageRecipesDataManager.shared.fetchPhoto(urlString ) {
//                let image = data.image
//                completion(.success(image?.data(using: .utf8) ?? Data()))
//            } else {
//                //ImageRecipesDataManager.shared.creatImage(urlString)
//                self.loadService.loadImage(url: url) { result in
//                    switch result {
//                    case let .success(data):
//                        ImageRecipesDataManager.shared.creatImage(String(data: data, encoding: .utf8) ?? "")
//                        completion(.success(data))
//                    case .failure:
//                        completion(.failure(.invalidateData))
//                    }
//                }
//
//            }
//        }
    }

    func saveImage(imageName: String, image: Data?) {
        do {
            guard
                let folder = fileManager.urls(
                    for: .desktopDirectory,
                    in: .userDomainMask
                ).first?.appendingPathComponent(Constants.pathName)
            else {
                return
            }
            print(folder.path)
            try? fileManager.createDirectory(at: folder, withIntermediateDirectories: true)
            let fileURL = folder.appendingPathComponent(imageName)
            try image?.write(to: fileURL)
        } catch {}
    }

    func loadingFromCache(imageName: String) -> Data? {
        guard
            let url = fileManager.urls(for: .desktopDirectory, in: .userDomainMask)
            .first?.appendingPathComponent(imageName)
        else { return nil }

        let data = try? Data(contentsOf: url)
        return data
    }
}
