//
//  Logging.swift
//  BookingApp
//
//  Created by Julien Delferiere on 24/08/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

enum LogLevel: String {
    case error = "[❤️]" // error
    case info = "[💙]" // info
    case debug = "[💚]" // debug
    case verbose = "[💜]" // verbose
    case warning = "[🧡]" // warning
}

func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
    Swift.print(object)
    #endif
}

class Logging {
    
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    class func error( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("[\(Date().toString())]\(LogLevel.error.rawValue)[\(sourceFileName(filePath: filename))][line:\(line)][\(funcName)]\(LogLevel.error.rawValue) -> \(object)")
        }
    }
    
    class func info( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("[\(Date().toString())]\(LogLevel.info.rawValue)[\(sourceFileName(filePath: filename))][line:\(line)][\(funcName)]\(LogLevel.info.rawValue) -> \(object)")
        }
    }
    
    class func debug( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("[\(Date().toString())]\(LogLevel.debug.rawValue)[\(sourceFileName(filePath: filename))][line:\(line)][\(funcName)]\(LogLevel.debug.rawValue) -> \(object)")
        }
    }

    class func verbose( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("[\(Date().toString())]\(LogLevel.verbose.rawValue)[\(sourceFileName(filePath: filename))][line:\(line)][\(funcName)]\(LogLevel.verbose.rawValue) -> \(object)")
        }
    }

    class func warning( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("[\(Date().toString())]\(LogLevel.warning.rawValue)[\(sourceFileName(filePath: filename))][line:\(line)][\(funcName)]\(LogLevel.warning.rawValue) -> \(object)")
        }
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

internal extension Date {
    func toString() -> String {
        return Logging.dateFormatter.string(from: self as Date)
    }
}
