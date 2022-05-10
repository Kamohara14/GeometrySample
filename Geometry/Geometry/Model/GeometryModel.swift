//
//  GeometryModel.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/07.
//

import Foundation

class GeometryModel {
    // ニュースのカテゴリーの配列
    let category = ["technology", "entertainment", "science", "business"]
    
    func getCategory(categoryNo: Int) -> String {
        return self.category[categoryNo]
    }
}
