//
//  NewsResponse.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/10.
//

import Foundation

// 使用するapi
// https://newsapi.org/v2/top-headlines?{pageSize: 記事数}&{country: 国}&{category: カテゴリ}&apiKey
// https://newsapi.org/v2/top-headlines?pageSize=10&country=jp&category=technology&apiKey

struct NewsRequest {
    // URL
    let urlStr: String
    
    // カテゴリを指定
    init(category: String) {
        self.urlStr = "https://newsapi.org/v2/top-headlines?country=jp&pageSize=10&category=\(category)&apiKey=52664340d22243fe870f35f3b72e08a4"
    }
}

// とってくる情報
struct NewsResponse: Decodable {
    
    // ステータス
    let status: String
    
    // 記事数
    let totalResults: Int
    
    // 記事
    var articles: [Articles]
    
}

struct Articles: Decodable {
    
    // 情報元
    let source: Source
    struct Source: Decodable {
        // ID
        let id: Int?
        // 発行元
        let name: String?
    }
    
    // 記者
    let author: String?
    
    // 記事のタイトル
    let title: String?
    
    // 記事の説明
    let description: String?
    
    // 記事元のURL
    let url: String?
    
    // urlのイメージ画像
    let urlToImage: String?
    
    // 投稿日
    let publishedAt: String?
}
