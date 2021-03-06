//
//  Date+ComponentAccessors.swift
//  ViaSwiftUtils
//
//  Copyright 2017 Viacom, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation

public extension Date {

    /// returns the hour of the receiver 'NSDate'
    var hourOfDay: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    /// returns the day of the week of the receiver 'NSDate'
    var dayOfWeek: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    /// returns the year of the receiver 'NSDate' as Int anno domini
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// returns the year of the receiver NSDate as localized String anno domini and a fixed dateFormat
    var localizedYear: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "y"
        return formatter.string(from: self)
    }
}
