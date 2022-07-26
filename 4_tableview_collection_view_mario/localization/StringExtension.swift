//
//  StringExtension.swift
//  4_tableview_collection_view_mario
//
//  Created by David Granado Jordan on 7/21/22.
//

import Foundation

extension String {
    static func localizeString(localizedString: String) -> String {
        return NSLocalizedString(localizedString, comment: "")
    }
    
    static func emailInvalid(localizedString: String, forEmail email: String) -> String {
        let str = NSLocalizedString(localizedString, comment: "")
        
        return String.localizedStringWithFormat( str, email )
    }
}
