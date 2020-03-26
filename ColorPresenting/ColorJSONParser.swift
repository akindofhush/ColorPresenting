//
//  ColorJSONParser.swift
//  ColorPresenting
//
//  Created by Tzu-Yen Huang on 2020/3/22.
//  Copyright © 2020 Tzu-Yen Huang. All rights reserved.
//

import Foundation

struct ColorObject: Codable {
    let id: Int
    let title: String
    let thumbnailUrl: URL
}
