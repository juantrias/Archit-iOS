//
//  ServiceLocator.swift
//  Archit
//
//  Created by Juan Trías on 13/12/17.
//  Copyright © 2017 Intelygenz. All rights reserved.
//

import Foundation
import Domain

public class ServiceLocator {

    public static let shared = ServiceLocator()

    private var logger: Logger?

    private init() {}

    public func provideLogger() -> Logger {
        guard let logger = self.logger else {
            self.logger = LoggerFactory().createLogger()
            return self.logger!
        }

        return logger
    }

}


