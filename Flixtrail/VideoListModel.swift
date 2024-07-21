//
//  VideoListModel.swift
//  Flixtrail
//
//  Created by Sagar on 12/07/24.
//

import Foundation

// View Model
class VideoListViewModel: ObservableObject {
    @Published var videos: [Video] = []

    func fetchVideos() {
        // Replace with your actual API call logic
        // Example using `URLSession` (modify based on your API)
        guard let url = URL(string: "http://localhost:8080/videos") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else { return }
            
            do {
                let decodedVideos = try JSONDecoder().decode([Video].self, from: data)
                DispatchQueue.main.async {
                    self.videos = decodedVideos
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
