//
//  GeometryViewModel.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/03.
//

import Foundation
import SwiftUI

class GeometryViewModel: ObservableObject {
    // model
    let model = GeometryModel()
    
    // 記事の色
    @Published var materialColor = Color.blue
    
    // 記事のカテゴリ
    @Published var categoryNo = 0
    
    func setCategory(no: Int) {
        self.categoryNo = no
    }
    
    func getCategory() -> Int {
        return categoryNo
    }
    
    func setColor(color: Color){
        self.materialColor = color
    }
    
    func getColor() -> Color {
        return materialColor
    }
    
    func getTitleSize(y: CGFloat) -> CGFloat {
        if(y <= 250 || y >= 510) {
            return 250
        }
        
        if(y <= 405) {
            return y
        } else {
            return 780 - y
        }
    }
    
    func getNews(categoryNo: Int, number: Int) -> String {
        return model.news[categoryNo][number]
    }
}


