//
//  Home.swift
//  InstagramReels
//
//  Created by Gagan Vishal  on 2023/11/27.
//

import SwiftUI

struct Home: View {
    var size: CGSize
    var safeArea: EdgeInsets
    
    @State private var reels: [Reel] = Reel.reelData
    @State private var likedCount: [Like] = []
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach($reels) { $reel in
                    ReelView(
                        reel: $reel,
                        likedCount: $likedCount,
                        size: size,
                        safeArea: safeArea
                    )
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .containerRelativeFrame(.vertical)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .background(.black)
        .overlay(alignment: .topLeading, content: {
            likeAnimationView
        })
        .overlay(alignment: .top, content: {
            Text("Reels")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing, content: {
                    Button("", systemImage: "camera") {
                        
                    }
                    .foregroundStyle(.white)
                })
                .padding(.top, safeArea.top + 10)
        })
        .environment(\.colorScheme, .dark)
    }
    
    private var likeAnimationView: some View {
        ZStack{
            ForEach(likedCount) {like in
                Image(systemName: "suit.heart.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(.red.gradient)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .animation(.smooth, body: { view in
                        view
                            .scaleEffect(like.isAnimated ? 1 : 1.2)
                            .rotationEffect(.init(degrees: like.isAnimated ? 0 : .random(in: -50...50)))
                    })
                    .offset(x: like.tappedRect.x - 50, y: like.tappedRect.y - 50)
                    .offset(y: like.isAnimated ? -(like.tappedRect.y + safeArea.top) : 0)
            }
        }
    }
}

#Preview {
    ContentView()
}
