//
//  Bundle-Decodable.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/30/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to load \(file) in URL")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to load \(file) in bundle")
        }

        return loaded
    }
}
