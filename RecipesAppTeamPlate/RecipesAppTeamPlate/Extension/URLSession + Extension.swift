// URLSession + Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

extension URLSession {
    /// Метод для передачи Результата в формате <Data,Error>
    func dataTask(with url: URL, handler: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        dataTask(with: url) { data, _, error in
            if let error = error {
                handler(.failure(error))
            } else if let data = data {
                handler(.success(data))
            }
        }
    }
}
