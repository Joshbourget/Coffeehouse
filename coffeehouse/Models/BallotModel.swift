//
//  BallotModel.swift
//  coffeehouse
//
//  Created by Josh Bourget on 3/29/24.
//

import Foundation

struct BallotModel: Decodable, Identifiable {
    var id: String
    var date: String
    var location: String
    var candidates: [CandidateModel]
    var offices: String
}
