//
//  ContentView.swift
//  InstagramReels
//
//  Created by Gagan Vishal  on 2023/11/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            Home(size: size, safeArea: safeArea)
                .ignoresSafeArea(.container, edges: .all)
        }
    }
}

#Preview {
    ContentView()
}
