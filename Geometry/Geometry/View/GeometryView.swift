//
//  GeometryView.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/03.
//

import SwiftUI

struct GeometryView: View {
    @ObservedObject var viewModel = GeometryViewModel()
    
    var body: some View {
        
        VStack {
            // 横向きにスクロール
            ScrollView(.horizontal) {
                HStack {
                    // スペース
                    Spacer().frame(width: 60)
                    
                    // IT
                    Button(action: {
                        viewModel.setCategory(no: 0)
                        viewModel.setColor(color: .blue)
                        
                    }){
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.blue)
                            .overlay(
                                Text("IT")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .font(.largeTitle)
                            )
                            .frame(width: 300, height: 100)
                    }
                    
                    // お笑い
                    Button(action: {
                        viewModel.setCategory(no: 1)
                        viewModel.setColor(color: .orange)
                    }){
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.orange)
                            .overlay(
                                Text("お笑い")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .font(.largeTitle)
                            ).frame(width: 300, height: 100)
                    }
                    
                    // 暮らし
                    Button(action: {
                        viewModel.setCategory(no: 2)
                        viewModel.setColor(color: .green)
                    }){
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.green)
                            .overlay(
                                Text("暮らし")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .font(.largeTitle)
                            ).frame(width: 300, height: 100)
                        
                    } //GeometryReader
                    .frame(width: 300)
                    
                    // その他
                    Button(action: {
                        viewModel.setCategory(no: 3)
                        viewModel.setColor(color: .gray)
                    }){
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.gray)
                            .overlay(
                                Text("その他")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .font(.largeTitle)
                            ).frame(width: 300, height: 100)
                    }
                    
                    // スペース
                    Spacer().frame(width: 60)
                    
                } // HS
            }.frame(height: 100)
            
            Rectangle()
                .fill(viewModel.getColor())
                .frame(height: 10)
            
            // ニュース表示
            NewsTitleView(viewModel: viewModel)
            
        } // VS
    }
}

struct GeometryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryView()
    }
}
