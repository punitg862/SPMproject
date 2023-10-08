// The Swift Programming Language: https://quickbirdstudios.com/blog/swift-package-manager-cocoapods-support/
// https://docs.swift.org/swift-book

import AEPAssurance
import AEPCore
import AEPServices
import Foundation

protocol AnalyticsManagerProtocol {
    func registerAdobe(logLevel: LogLevel, ENVIRONMENT_FILE_ID: String)
    func setAssuranceSessionUrl(withUrl: String)
}

class AnalyticsManager: AnalyticsManagerProtocol {
    
    func registerAdobe(logLevel: LogLevel, ENVIRONMENT_FILE_ID: String) {
        
        MobileCore.setLogLevel(logLevel)
        
        MobileCore.configureWith(appId: ENVIRONMENT_FILE_ID)
    }
    
    func setAssuranceSessionUrl(withUrl: String) {
        if let url = URL(string: withUrl) {
            Assurance.startSession(url: url)
        }
    }
    
    func sendAnalyticsData(with sourceName: ScreenName) {
        print(sourceName.rawValue)
        
        MobileCore.setPrivacyStatus(PrivacyStatus.optedOut)
        MobileCore.setPrivacyStatus(PrivacyStatus.optedIn)
        MobileCore.setPrivacyStatus(PrivacyStatus.unknown)
        
        
        MobileCore.track(state: "", data: ["number": 50, "key": "testState"])
        MobileCore.track(action: "", data: ["number": 25, "key": "testAction"])
        
        Analytics.getQueueSize { (queueSize, _) in
             print(String(queueSize))
        }
        
        Analytics.sendQueuedHits()
        
        Analytics.clearQueue()
        
        Analytics.getTrackingIdentifier { trackingId, err in
            print(trackingId ?? "No tracking identifier.")
        }
        
        Analytics.getVisitorIdentifier { (visitorId, _) in
            print(visitorId ?? "No visitor identifier.")
        }
        
        let visitorId: String = ""
        Analytics.setVisitorIdentifier(visitorIdentifier: visitorId)
    }
    
    
}
