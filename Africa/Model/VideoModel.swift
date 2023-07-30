//
//  VideoMdel.swift
//  Africa
//
//  Created by Matheus Xavier on 30/07/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        return "video-\(id)"
    }
}
