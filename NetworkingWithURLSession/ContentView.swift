//
//  ContentView.swift
//  NetworkingWithURLSession
//
//  Created by Delano January on 26/12/2020.
//

import SwiftUI

struct User: Decodable {
    var id: UUID
    var name: String

    static let `default` = User(id: UUID(), name: "Anonymous")
}

struct ContentView: View {
    var body: some View {
        Button("Fetch Data") {
            let url = URL(string: "https://www.hackingwithswift.com/samples/user-24601.json")!
            self.fetch(url)
        }
    }
    
    func fetch(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(User.default.name)
            } else if let data = data {
                let decoder = JSONDecoder()

                do {
                    let user = try decoder.decode(User.self, from: data)
                    print(user.name)
                } catch {
                    print(User.default.name)
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
