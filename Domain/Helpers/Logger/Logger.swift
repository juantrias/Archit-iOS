//
//  Logger.swift
//  Domain
//
//  Created by Juan Trías on 13/12/17.
//  Copyright © 2017 Intelygenz. All rights reserved.
//

import Foundation

public protocol Logger {
    func verbose(_ functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func verbose(_ closure: @autoclosure () -> Any?, functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func debug(_ functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func debug(_ closure: @autoclosure () -> Any?, functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func info(_ functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func info(_ closure: @autoclosure () -> Any?, functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func warning(_ functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func warning(_ closure: @autoclosure () -> Any?, functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func error(_ functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func error(_ closure: @autoclosure () -> Any?, functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func severe(_ functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])
    func severe(_ closure: @autoclosure () -> Any?, functionName: StaticString, fileName: StaticString, lineNumber: Int, userInfo: [String: Any])

    func logAppDetails()
}

public extension Logger {

    func verbose(_ functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        verbose(functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func verbose(_ closure: @autoclosure () -> Any?, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        verbose(closure, functionName: functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func debug(_ functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        debug(functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func debug(_ closure: @autoclosure () -> Any?, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        debug(closure, functionName: functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func info(_ functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        info(functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func info(_ closure: @autoclosure () -> Any?, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        info(closure, functionName: functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func warning(_ functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        warning(functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func warning(_ closure: @autoclosure () -> Any?, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        warning(closure, functionName: functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func error(_ functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        error(functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func error(_ closure: @autoclosure () -> Any?, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        error(closure, functionName: functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func severe(_ functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        severe(functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }

    func severe(_ closure: @autoclosure () -> Any?, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line, userInfo: [String: Any] = [:]) {
        severe(closure, functionName: functionName, fileName: fileName, lineNumber: lineNumber, userInfo: userInfo)
    }
}
