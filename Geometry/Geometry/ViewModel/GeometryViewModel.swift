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
    
    func setColor(color: Color){
        self.materialColor = color
    }
    
    func getColor() -> Color {
        return materialColor
    }
    
    func getColor(y: CGFloat) -> Color {
        if(y >= 380 && y <= 500) {
            return .red
        } else {
            return materialColor
        }
    }
}


