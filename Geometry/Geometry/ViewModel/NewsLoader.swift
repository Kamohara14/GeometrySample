//
//  NewsLoader.swift
//  Geometry
//
//  Created by cmStudent on 2022/05/10.
//

import Foundation
import SwiftUI

class NewsLoader: ObservableObject {
    
    init() {
        // 起動時に実行
        getNews()
    }
    
    // ステータス
    var status = false
    
    // カテゴリ(初期はテクノロジ)
    @Published var categoryNumber = 0
    
    // 発行元
    @Published var name = "発行元"
    
    // 記者
    @Published var author = ""
    
    // 記事のタイトル
    @Published var title = "タイトル"
    
    // 記事の説明
    @Published var description = "説明"
    
    // 記事元のURL
    @Published var url = "URL"
    
    // urlのイメージ
    @Published var urlToImage = "URLImage"
    
    // 投稿日
    @Published var publishedAt = "投稿日"
    
    // ニュースの配列
    @Published var results = [Articles]()
    
    // カテゴリー指定(再度ニュースを取得する)
    func setCategory(num: Int) {
        self.categoryNumber = num
        getNews()
    }
    
    func getNews() {
        // 計測場所を指定したURLを取得
        let newsRequest = NewsRequest(category:GeometryModel().getCategory(categoryNo: self.categoryNumber))
        print("URL: \(newsRequest.urlStr)")
        
        // JSON変換
        let jsonConverter = JSONConverter(urlString: newsRequest.urlStr)
        self.urlToImage = "batu"
        print("EXE: getNews()")
        jsonConverter.resume { data, response, error in
            
            // エラーが起きたなら
            if error != nil {
                print("nilエラー")
                return
            }
            
            // HTTPレスポンスが取れるかどうか
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  (200...399).contains(response.statusCode) else {
                      print("レスポンスエラー")
                      return
                  }
            
            // URLが取れるかどうか
            guard URL(string: newsRequest.urlStr) != nil else {
                print("URL読み込みエラー")
                return
            }
            
            do {
                // JSONを取ってくる
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                // メインスレッドから行う
                DispatchQueue.main.async {
                    if(newsResponse.status == "ok") {
                        self.results = newsResponse.articles
                        
                        print("ok \(self.results.count)")
                        
                        self.name = newsResponse.articles[0].source.name ?? "---"
                        self.author = newsResponse.articles[0].author ?? "---"
                        self.title = newsResponse.articles[0].title ?? "---"
                        self.description = newsResponse.articles[0].description ?? "---"
                        self.url = newsResponse.articles[0].url ?? "---"
                        self.urlToImage = newsResponse.articles[0].urlToImage ?? "batu"
                        self.publishedAt = newsResponse.articles[0].publishedAt ?? "---"
                    } else {
                        print("取得できませんでした")
                        self.name = "取得できませんでした"
                        self.title = "取得できませんでした"
                        self.description = "取得できませんでした"
                        self.url = "取得できませんでした"
                        self.urlToImage = "取得できませんでした"
                        self.publishedAt = "取得できませんでした"
                    }
                }
                
            } catch {
                print("ERROR: \(error)")
                return
            }
        }
    }
}
