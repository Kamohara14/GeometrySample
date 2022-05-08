//
//  NewsView.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/08.
//

import Foundation
import SwiftUI

struct NewsView: View {
    var title: String
    
    var body: some View {
        // サンプル
        VStack {
            Text(title)
                .fontWeight(.heavy)
                .font(.largeTitle)
            
            Spacer()
        }
    }
}
