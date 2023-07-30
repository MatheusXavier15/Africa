//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Matheus Xavier on 30/07/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String
    
    // MARK: - BODY
    var body: some View {
        if let player = playVideo(fileName: videoSelected, fileFormat: "mp4") {
            VStack {
                VideoPlayer(player: player) {
//                    Text(videoTitle)
                }
                .overlay(alignment: .topLeading) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.horizontal, 8)
                }
            }
            .accentColor(.accentColor)
            .navigationTitle(videoTitle)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Text("Vídeo indisponível.")
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
        }
    }
}
