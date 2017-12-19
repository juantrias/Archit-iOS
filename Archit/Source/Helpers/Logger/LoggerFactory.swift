//
//  LoggerFactory.swift
//  Archit
//
//  Created by Juan Trías on 13/12/17.
//  Copyright © 2017 Intelygenz. All rights reserved.
//

import Foundation
import XCGLogger

class LoggerFactory {

    private struct Identifier {
        static let mainLogger = "mainLogger"

        struct Destination {
            static let console = "\(Identifier.mainLogger).consoleDestination"
        }
    }

    func createLogger() -> XCGLogger {
        let log = XCGLogger(identifier: Identifier.mainLogger, includeDefaultDestinations: false)
        log.levelDescriptions[.verbose] = "💜"
        log.levelDescriptions[.debug] = "💚"
        log.levelDescriptions[.info] = "💙"
        log.levelDescriptions[.warning] = "💛"
        log.levelDescriptions[.error] = "❤️"
        log.levelDescriptions[.severe] = "🖤"

        let consoleDestination = ConsoleDestination(identifier: Identifier.Destination.console)
        #if DEBUG
            consoleDestination.outputLevel = .debug
        #else
            consoleDestination.outputLevel = .severe
        #endif
        consoleDestination.showLevel = true
        consoleDestination.showFunctionName = false
        consoleDestination.showFileName = false
        consoleDestination.showLineNumber = false
        log.add(destination: consoleDestination)

        return log
    }
}
