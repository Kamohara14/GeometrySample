//
//  NewsView.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/08.
//

import Foundation
import SwiftUI

struct NewsView: View {
    var result: Articles
    
    var body: some View {
        VStack {
            // タイトル
            Text(result.title ?? "---")
                .fontWeight(.heavy)
                .font(.title)
            
            // 投稿日時
            Text(result.publishedAt ?? "---")
                .fontWeight(.heavy)
            
            
            Spacer()
            
            // 記事の内容
            Text(result.description ?? "---")
            
            Spacer()
            Spacer()
            
            // url
            Text(result.url ?? "---")
        }
    }
}
