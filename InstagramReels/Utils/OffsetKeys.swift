//
//  OffsetKeys.swift
//  InstagramReels
//
//  Created by Gagan Vishal  on 2023/11/27.
//

import SwiftUI

struct OffsetKeys: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
