//
//  NewsTitleView.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/07.
//

import SwiftUI

struct NewsTitleView: View {
    @ObservedObject var viewModel: GeometryViewModel
    @ObservedObject var newsLoader: NewsLoader
    
    var body: some View {
        NavigationView {
                VStack {
                    
                    // List
                    List(newsLoader.results, id: \.description) { result in
                        GeometryReader { geometry in
                            HStack {
                                // ニュース詳細へ飛ぶ
                                NavigationLink(destination: NewsView(result: result)) {
                                    Rectangle()
                                        .stroke(lineWidth: 3)
                                        .fill(viewModel.getColor(y: geometry.frame(in: .global).origin.y))
                                        .overlay(
                                            HStack {
                                                // ニュースのタイトル
                                                Text(result.title ?? "---")
                                                    .foregroundColor(viewModel.getColor(y: geometry.frame(in: .global).origin.y))
                                                    .fontWeight(.heavy)
                                                    .font(.title2)
                                            }
                                            
                                        )
                                        .frame(height: 100)
                                } // NaviLink
                            } // HS
                        } //GeometryReader
                        .frame(height: 100)
                    }// List
                } // VS
        } // Navi
    }
}

struct NewsTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTitleView(viewModel: GeometryViewModel(), newsLoader: NewsLoader())
    }
}
