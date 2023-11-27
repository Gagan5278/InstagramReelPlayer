//
//  ReelView.swift
//  InstagramReels
//
//  Created by Gagan Vishal  on 2023/11/27.
//

import SwiftUI
import AVKit

struct ReelView: View {
    private let paddingConstant: CGFloat = 10.0
    @Binding var reel: Reel
    @Binding var likedCount: [Like]
    var size: CGSize
    var safeArea: EdgeInsets
    @State private var player: AVPlayer?
    @State private var looper: AVPlayerLooper?
    var body: some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            CustomVideoPlayer(player: $player)
                .preference(key: OffsetKeys.self, value: rect)
                .onPreferenceChange(OffsetKeys.self, perform: { value in
                    playPauseVideo(value)
                })
                .overlay(alignment: .bottom, content: {
                    reelDetailsView()
                })
                .onTapGesture(count: 2, perform: { position in
                    let id = UUID()
                    
                    likedCount.append(.init(id: id,tappedRect: position, isAnimated: false))
                    
                    withAnimation(.snappy(duration: 1), completionCriteria: .logicallyComplete) {
                        if let index = likedCount.firstIndex(where: {$0.id == id}) {
                            likedCount[index].isAnimated = true
                        }
                    } completion: {
                        likedCount.removeAll(where: { $0.id == id })
                    }
                    reel.isLiked = true
                })
                    
                .onAppear {
                    guard player == nil, let videoURL = Bundle.videoURLForFile(name: reel.videoID) else { return }
                    let playerItem = AVPlayerItem(url: videoURL)
                    let queue = AVQueuePlayer(playerItem: playerItem)
                    looper = AVPlayerLooper(player: queue, templateItem: playerItem)
                    player = queue
                }
                .onDisappear {
                    player = nil
                }
        }
    }
    
    private func playPauseVideo(_ rect: CGRect) {
        if -rect.minY < (rect.height * 0.5) && rect.minY < (rect.height * 0.5) {
            player?.play()
        } else {
            player?.pause()
        }
        
        if rect.minY >= size.height || -rect.minY >= size.height {
            player?.seek(to: .zero)
        }
    }
    
    @ViewBuilder
    func reelDetailsView() -> some View {
        HStack(alignment: .bottom, spacing: paddingConstant) {
            VStack(alignment: .leading, spacing: paddingConstant) {
                HStack(spacing: paddingConstant) {
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                    Text(reel.authorName)
                        .font(.callout)
                        .bold()
                }
                Text(reel.desciption)
                    .font(.caption)
                    .lineLimit(3)
                    .clipped()
            }
            Spacer(minLength: paddingConstant)
            VStack(spacing: paddingConstant*2.5) {
                Button("", systemImage: reel.isLiked ? "heart.fill" : "heart") {
                    reel.isLiked.toggle()
                }
                .symbolEffect(.bounce, value: reel.isLiked)
                .foregroundStyle(reel.isLiked ? .red : .white)
                Button("", systemImage:"message") {
                }
                Button("", systemImage: "paperplane") {
                }
            }
            .font(.title2)
            .foregroundColor(.white)
        }
        .padding(.trailing, paddingConstant)
        .padding(.leading, paddingConstant)
        .padding(.bottom, safeArea.bottom + paddingConstant)
    }
}

#Preview {
    ContentView()
}
