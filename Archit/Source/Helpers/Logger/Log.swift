//
//  Log.swift
//  Archit
//
//  Created by Juan Trías on 13/12/17.
//  Copyright © 2017 Intelygenz. All rights reserved.
//

import Foundation
import Domain
import Core

let log: Logger = {
    ServiceLocator.shared.provideLogger()
}()
