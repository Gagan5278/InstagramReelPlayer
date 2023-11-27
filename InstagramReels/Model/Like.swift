//
//  Like.swift
//  InstagramReels
//
//  Created by Gagan Vishal  on 2023/11/27.
//

import SwiftUI

struct Like: Identifiable {
    let id: UUID 
    var tappedRect: CGPoint = .zero
    var isAnimated: Bool = false
}
