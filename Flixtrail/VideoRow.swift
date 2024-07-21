//
//  VideoRow.swift
//  Flixtrail
//
//  Created by Sagar on 12/07/24.
//

import SwiftUI
import AVKit


struct VideoRow: View {
    let video: Video

    @State private var isDownloaded = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(video.title)
                .font(.headline)
            Text(video.description)
                .font(.subheadline)
            if let videoPath = video.videoPath {
                if isDownloaded {
                    // Show video player if downloaded
                    if let url = Bundle.main.url(forResource: videoPath, withExtension: "mp4") {

                        VideoPlayer(player: AVPlayer(url: url))
                    } else {
                        // Handle case where video file is not found
                        Text("Video not found")
                    }
                } else {
                    Button("Download Video") {
                        // Implement download logic with user consent and handle completion/errors
                        isDownloaded = true // Update state for downloaded video (modify based on actual download logic)
                    }
                }
            } else {
                Text("Video not available")
            }
        }
    }
}//#Preview {
//    VideoRow()
//}
