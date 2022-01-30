//
//  Formatter.swift
//  Coffee
//
//  Created by Aliaksandr Matarykin on 12/24/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class Formatter {
    enum Volume: String {
        case ml
    }
    
    enum Mass: String {
        case mg
    }
    
    static var volume: Volume = .ml
    static var mass: Mass = .mg
    
    private static let dateWithoutTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    // MARK: - LocalizedFormatter
    
    static func formatCaffeineIn100ml(_ value: Int16) -> String {
        return "\(formatMass(value))/\(formatVolume(100))"
    }

    // MARK: - General formatter
    
    static func formatVolume(_ value: Int16) -> String {
        return "\(value) \(volume.rawValue)"
    }
    
    static func formatMass(_ value: Int16) -> String {
        return "\(value) \(mass.rawValue)"
    }

    static func formatPercent(_ value: Int) -> String {
        return "\(value)%"
    }

    static func formatCMSSectionDate(_ date: Date) -> String {
        return dateWithoutTimeFormatter.string(from: date)
    }

    static func formatCMSTime(_ date: Date) -> String {
        return timeFormatter.string(from: date)
    }
}
