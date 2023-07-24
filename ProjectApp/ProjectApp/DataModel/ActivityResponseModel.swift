//
//  Activity.swift
//  ProjectApp
//
//  Created by Liubov on 22.07.2023.
//

import Foundation

struct ActivityResponseModel : Codable {
    let activity: String
    let type: String
    let participants: Int64
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}
