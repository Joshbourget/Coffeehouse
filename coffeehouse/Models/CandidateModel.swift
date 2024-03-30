//
//  CandidateModel.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/29/24.
//

import Foundation

struct CandidateModel: Decodable, Identifiable {
    var id: String
    var name: String
    var pfpURL: String
    var websiteURL: String
    var office: String
}
