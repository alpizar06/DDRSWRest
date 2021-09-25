//
//  DDRSWRest.swift
//  DDRSWRest
//
//  Created by Daniel Alpizar on 24/9/21.
//

import Foundation

var BaseURL: String = "https://animechan.vercel.app/api/random"
//var obj: objc_object

struct Anime: Decodable {
    var anime: String
    var character: String
    var quote: String
}
 var RandomCaracter = Anime(anime: "", character: "", quote: "")

func loadCaracter(){
    
    guard let url = URL(string: BaseURL) else {
        print("Your API end point is Invalid")
        return
        
    }
    let request = URLRequest(url: url)
    
    // The shared singleton session object.
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(Anime.self, from: data){
                DispatchQueue.main.async {
                    RandomCaracter = response
                }
            }
            return
        }
    }.resume()
}
