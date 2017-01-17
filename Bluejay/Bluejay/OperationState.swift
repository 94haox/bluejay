//
//  OperationState.swift
//  Bluejay
//
//  Created by Jeremy Chiang on 2017-01-03.
//  Copyright © 2017 Steamclock Software. All rights reserved.
//

import Foundation

enum OperationState {
    case notStarted
    case running
    case failed(NSError)
    case completed
}
