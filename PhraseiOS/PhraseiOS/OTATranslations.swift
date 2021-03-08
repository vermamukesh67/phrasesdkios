//
//  OTATranslations.swift
//  phraseapp-demo
//
//  Created by Mohammad Ashour on 2019-06-13.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import PhraseSDK

class OTATranslations {
    static let shared = OTATranslations()
    
    private init() {
        #if DEBUG
        Phrase.shared.debugMode = true
        #endif
        
        let config: PList? = loadConfig()
        
        if let config = config {
            #if DEBUG
            let environmentTokenKey: String = "devToken"
            #else
            let environmentTokenKey: String = "prodToken"
            #endif
            print(config.getValue(withKey: environmentTokenKey))
            Phrase.shared.setup(
                distributionID: config.getValue(withKey: "distributionID"),
                environmentSecret: config.getValue(withKey: environmentTokenKey),
                timeout: config.getValue(withKey: "timeout")
            )
        }
    }
    
    func updateTranslations(onUpdateComplete: (() -> Void)? = nil) {
        do {
            try Phrase.shared.updateTranslations { result in
                switch result {
                    
                case .success(let updated):
                    if updated {
                        printIfDebug("Translations updated successfully")
                        
                        onUpdateComplete?()
                    } else {
                        onUpdateComplete?()
                        printIfDebug("No new translations found")
                    }
                    
                case .failure:
                    printIfDebug("Failure updating translations")
                }
            }
        } catch {
            printIfDebug("Error updating translations: \(error)")
        }
    }
    
    fileprivate func loadConfig() -> PList? {
        do {
            return try PList(pListResource: "PhraseApp")
        } catch {
            printIfDebug(
                "Error loading PhraseApp configuration from plist, \(error)")
        }
        
        return nil
    }
}
