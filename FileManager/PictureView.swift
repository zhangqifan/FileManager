//
//  PictureView.swift
//  FileManager
//
//  Created by Shuhari on 2022/11/17.
//

import SwiftUI

struct PictureView: View {
    
    let imageString: String
    let title: String
    
    @GestureState private var isTouchDown = false
    @State private var uiImage: UIImage? = nil
    
    var body: some View {
        VStack {
            imageView(with: uiImage)
                .scaleEffect(x: isTouchDown ? 0.98 : 1, y: isTouchDown ? 0.98 : 1)
                .animation(.spring(), value: isTouchDown)
            
            Text(title)
                .font(.system(size: 18, weight: .medium))
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .updating($isTouchDown, body: { _, state, _ in
                    state = true
                    if isTouchDown == false {
                        let fb = UIImpactFeedbackGenerator(style: .soft)
                        fb.impactOccurred()
                    }
                })
                .onEnded({ _ in
                    let data = uiImage?.jpegData(compressionQuality: 1.0)
                    let dir = getDocumentDirectory()?.appending(component: fixedImageFileName()).appendingPathExtension("jpg")
                    saveImageData(data, to: dir)
                })
        )
        .onAppear {
            retrieve(URL(string: imageString)!) { image in
                withAnimation {
                    uiImage = image
                }
            }
        }
    }
    
    @ViewBuilder
    private func imageView(with uiImage: UIImage?) -> some View {
        if let uiImage {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 200)
                .cornerRadius(12)
                .transition(.opacity)
        } else {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray.opacity(0.1))
                .frame(width: 160, height: 200)
                .overlay {
                    Color.gray.opacity(0.1)
                        .overlay {
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                }
        }
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(imageString: "https://images.unsplash.com/photo-1668450433152-e56d7e8fe4ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80", title: "Picture 1")
    }
}
