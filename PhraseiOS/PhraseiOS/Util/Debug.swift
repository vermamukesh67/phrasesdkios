//
//  Debug.swift
//  phraseapp-demo
//
//  Created by Mohammad Ashour on 2019-06-13.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

func printIfDebug(_ text: String) {
    #if DEBUG
    print(text)
    #endif
}
