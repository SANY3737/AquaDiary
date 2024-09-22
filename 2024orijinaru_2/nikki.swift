//
//  nikki.swift
//  2024orijinaru_2
//
//  Created by HIDAKA SANA on 2024/07/14.
//

import Foundation
import RealmSwift

class Nikki: Object{
    @Persisted var date: String = ""
    @Persisted var stamp: Int = 0
    @Persisted var nikkitext: String = ""
}
