//
//  Gallery.swift
//  FileManager
//
//  Created by Shuhari on 2022/11/16.
//

import SwiftUI
import Kingfisher

struct Gallery: View {

    private let image1: String = "https://images.unsplash.com/photo-1668450433152-e56d7e8fe4ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80"

    private let image2: String = "https://images.unsplash.com/photo-1668503715495-28e0167e8df8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2187&q=80"
    
    var body: some View {
        HStack {
            PictureView(imageString: image1, title: "Picture 1")
            PictureView(imageString: image2, title: "Picture 2")
        }
    }
}

struct Gallery_Previews: PreviewProvider {
    static var previews: some View {
        Gallery()
    }
}
