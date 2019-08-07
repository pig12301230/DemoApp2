//
//  Result.swift
//  Demo
//
//  Created by 莊英祺 on 2019/8/7.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation

struct Result: Decodable{
    var albumId: Int
    var id: Int
    var title: String
    var url: URL
    var thumbnailUrl: URL
}
