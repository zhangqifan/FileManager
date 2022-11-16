//
//  SandboxHelper.swift
//  FileManager
//
//  Created by Shuhari on 2022/11/16.
//

import Foundation
import SwiftUI
import Kingfisher

// MARK: - save and load

func getDocumentDirectory() -> URL? {
    try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
}

func saveImageData(_ imageData: Data?, to destination: URL?) {
    guard let destination, let imageData else { return }
    do {
        try imageData.write(to: destination)
    } catch {
        print("Error: \(error)")
    }
}

func loadImage(from filePath: URL?) -> Data? {
    guard let filePath else { return nil }
    if FileManager.default.fileExists(atPath: filePath.path()) {
        do {
            let data = try Data(contentsOf: filePath)
            return data
        } catch {
            print("Error: \(error)")
        }
    }
    return nil
}

func clearStoredImage(at destination: URL?) -> Bool {
    guard let destination else { return false }
    do {
        try FileManager.default.removeItem(at: destination)
        return true
    } catch {
        print("Error: \(error)")
    }
    return false
}

func fixedImageFileName() -> String {
    "Picture"
}

// MARK: - manage image data

func retrieve(_ resource: URL, completionHandler: @escaping (UIImage?) -> Void) {
    KingfisherManager.shared.retrieveImage(with: resource) { result in
        switch result {
        case .success(let value):
            completionHandler(value.image)
        case .failure:
            completionHandler(nil)
        }
    }
}
