//
//  Score.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 18/12/23.
//

import Foundation

class Score:Decodable,Encodable{
    let username:String
    let score:Int 
    init(username: String, score: Int) {
        self.username = username
        self.score = score
    }
}
