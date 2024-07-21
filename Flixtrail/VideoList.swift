//
//  VideoList.swift
//  Flixtrail
//
//  Created by Sagar on 12/07/24.
//

import SwiftUI

struct VideoList: View {
    @StateObject private var viewModel = VideoListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.videos) { video in
                    VideoRow(video: video)
                }
            }
            .navigationTitle("Videos")
            .onAppear {
                viewModel.fetchVideos()
            }
        }
    }
}

#Preview {
    VideoList()
}
