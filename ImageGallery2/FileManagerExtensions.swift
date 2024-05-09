//
//  FileManagerExtensions.swift
//  ImageGallery2
//
//  Created by Christian Manzaraz on 09/05/2024.
//

import Foundation

extension FileManager {
    // The URL of the document directory.
    var documentDirectory: URL? {
        return self.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    /// Copies the specified file URL to a file with the same name in the document directory.
    ///
    ///  - parameter url: The file URL to be copied
    ///
    ///  - returns: The URL of copied or existing file in the documents directory, or nil if the file copy failed.
    ///
    func copyItemToDocumentDirectory(from sourceURL: URL) -> URL? {
        guard let documentDirectory = documentDirectory else { return nil }
        
        let fileName = sourceURL.lastPathComponent
        let destinationURL = documentDirectory.appendingPathComponent(fileName)
        
        if self.fileExists(atPath: destinationURL.path) {
            return destinationURL
        } else {
            do {
                try self.copyItem(at: sourceURL, to: destinationURL)
                return destinationURL
            } catch let error {
                print("Unable to copy file: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    /// Removes an item with te specified file URL from the document directory, if present.
    ///
    ///  - parameter url: The file URL to be removed.
    ///
    func removeItemFromDocumentDirectory(url: URL) {
        guard let documentDirectory = documentDirectory else { return }
        let fileName = url.lastPathComponent
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        if self.fileExists(atPath: fileUrl.path) {
            do {
                try self.removeItem(at: url)
            } catch let error {
                print("Unable to remove file: \(error.localizedDescription)")
            }
        }
    }
    
    /// Returns the contents of the specified directory as an array of URLs
    func getContentsOfDirectory(_ url: URL) -> [URL] {
        var isDirectory: ObjCBool = false
        // The URL must to be a directory
        guard FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory), isDirectory.boolValue
        else { return [] }
        
        do {
            return try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
        } catch let error {
            print("Unable to get directory contents: \(error.localizedDescription)")
        }
        
        return []
    }
}
