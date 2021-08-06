//
//  SaveAndLoadDataOnDevice.swift
//  Help
//
//  Created by Sergey Lukaschuk on 06.08.2021.
//

import UIKit

class SaveAndLoadDataOnDevice {
    
    // Create an archive file
    var archiveURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        return documentDirectory.appendingPathComponent("nameFile").appendingPathExtension("plist")
    }
    
    // Decoding an object from an archive
    func loadAll() -> [SameObject]? {
        let decoder = PropertyListDecoder()
        guard let archiveURL = archiveURL else { fatalError() }
        guard let decoderSameObject = try? Data(contentsOf: archiveURL) else { fatalError() }
        return try? decoder.decode([SameObject].self, from: decoderSameObject)
    }
    
    // Encoder the received object into the archive file
    func saveEmojis(_ object: [SameObject]) {
        let encoder = PropertyListEncoder()
        guard let archiveURL = archiveURL else { fatalError() }
        guard let encoderSameObject = try? encoder.encode(object) else { fatalError() }
        try? encoderSameObject.write(to: archiveURL, options: .noFileProtection)
    }
}

// Class have to protocol 'Codable'
class SameObject: Codable {
    
}
