//
//  NetworkManager.swift
//  H4XNews - SwiftUI
//
//  Created by Sai Naveen Katla on 11/09/20.
//  Copyright © 2020 Sai Naveen Katla. All rights reserved.
//

import Foundation

struct Results: Codable {
    let hits: [Posts]
}

struct Posts: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

class NetworkManager: ObservableObject {
    
    @Published var posts = [Posts]()
    
    func fetchData() {
        //create url
        //create session
        //give task to session
        //start task
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safedata = data {
                        do {
                            let decodedData = try decoder.decode(Results.self, from: safedata)
                            DispatchQueue.main.async {
                                self.posts = decodedData.hits
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
                else {
                    print(error!)
                }
            }
            task.resume()
        }
    }
}
