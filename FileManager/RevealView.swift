//
//  RevealView.swift
//  FileManager
//
//  Created by Shuhari on 2022/11/16.
//

import SwiftUI

struct RevealView: View {
    
    @State private var imageData: Data? = nil
    
    var body: some View {
        VStack {
            Text("Now in sandbox:")
                .foregroundColor(.gray.opacity(0.6))
            
            if let imageData {
                Image(uiImage: UIImage(data: imageData)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 200)
                    .cornerRadius(12)
            } else {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(width: 160, height: 200)
            }
            
            HStack {
                
                let dir = getDocumentDirectory()?.appending(component: fixedImageFileName()).appendingPathExtension("jpg")
                
                Button("Load") {
                    imageData = loadImage(from: dir)
                }
                .buttonStyle(.bordered)
                
                Button("Clear") {
                    let flag = clearStoredImage(at: dir)
                    if flag {
                        imageData = nil
                    }
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct RevealView_Previews: PreviewProvider {
    static var previews: some View {
        RevealView()
    }
}
