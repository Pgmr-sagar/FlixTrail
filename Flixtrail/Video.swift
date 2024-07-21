//
//  Video.swift
//  Flixtrail
//
//  Created by Sagar on 12/07/24.
//

import Foundation

struct Video: Identifiable, Decodable {
    let id: Int
    let title: String
    let description: String
    let videoPath: String? // URL of the video or thumbnail
}
