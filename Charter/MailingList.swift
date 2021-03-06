//
//  MailingListType.swift
//  Swift Mailing List
//
//  Created by Matthew Palmer on 4/02/2016.
//  Copyright © 2016 Matthew Palmer. All rights reserved.
//

import UIKit

protocol MailingListType {
    var identifier: String { get }
    var name: String { get }
}

struct _MailingList: MailingListType {
    let identifier: String
    let name: String
}

enum MailingList: RawRepresentable {
    typealias RawValue = MailingListType
    
    case SwiftEvolution, SwiftUsers, SwiftDev
    
    static var cases: [MailingList] = [.SwiftEvolution, .SwiftUsers, .SwiftDev]
    
    init?(rawValue: MailingListType) {
        switch rawValue.identifier {
        case "swift-evolution":
            self = .SwiftEvolution
        case "swift-users":
            self = .SwiftUsers
        case "swift-dev":
            self = .SwiftDev
        default:
            return nil
        }
    }
    
    var rawValue: MailingListType {
        switch self {
        case .SwiftEvolution:
            return _MailingList(identifier: "swift-evolution", name: "Swift Evolution")
        case .SwiftUsers:
            return _MailingList(identifier: "swift-users", name: "Swift Users")
        case .SwiftDev:
            return _MailingList(identifier: "swift-dev", name: "Swift Dev")
        }
    }
}
