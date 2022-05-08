//
//  NewsTitleView.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/07.
//

import SwiftUI

struct NewsTitleView: View {
    @ObservedObject var viewModel: GeometryViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // スペース
                    Spacer().frame(height: 150)
                    
                    // 9つ作成する
                    ForEach(0..<9) { num in
                        GeometryReader { geometry in
                            HStack {
                                
                                // スペース
                                Spacer()
                                
                                // ニュース詳細へ飛ぶ(サンプル)
                                NavigationLink(destination: NewsView(title: viewModel.getNews(categoryNo: viewModel.getCategory(), number: num))) {
                                    Rectangle()
                                        .stroke(lineWidth: 3)
                                        .fill(viewModel.getColor())
                                        .overlay(
                                            HStack {
                                                // ニュースのタイトル
                                                Text(viewModel.getNews(categoryNo: viewModel.getCategory(), number: num))
                                                    .foregroundColor(viewModel.getColor())
                                                    .fontWeight(.heavy)
                                                    .font(.largeTitle)
                                            }
                                            
                                        )
                                        // スクロールに合わせてサイズを変更する
                                        .frame(width:  viewModel.getTitleSize(y: geometry.frame(in: .global).origin.y), height: 100)
                                        
                                }
                                // スペース
                                Spacer()
                                
                            } // HS
                        } //GeometryReader
                        .frame(height: 100)
                        
                    } // ForEach
                    
                    // スペース
                    Spacer().frame(height: 350)
                    
                } // VS
            } // Scroll
        } // Navi
    }
}
