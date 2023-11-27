//
//  Bundle+Extension.swift
//  InstagramReels
//
//  Created by Gagan Vishal  on 2023/11/27.
//

import Foundation

extension Bundle {
     static func videoURLForFile(name: String, type: String = "mov") -> URL? {
       guard 
        let videoPath = main.path(forResource: name, ofType: type)
         else { return nil}
       return URL(filePath: videoPath)
    }
}
