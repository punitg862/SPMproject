// The Swift Programming Language: https://quickbirdstudios.com/blog/swift-package-manager-cocoapods-support/
// https://docs.swift.org/swift-book

import AEPAssurance
import AEPCore
import AEPServices
import Foundation



public class AnalyticsManager: NSObject {
    
    public static let shared = AnalyticsManager()
    
    private override init() { }
    
    public func registerAdobe(logLevel: LogLevel, ENVIRONMENT_FILE_ID: String, startSession: Bool = true, sessionUrl: String? = nil) {
        
        MobileCore.setLogLevel(logLevel)
        MobileCore.configureWith(appId: ENVIRONMENT_FILE_ID)
        
        guard sessionUrl != nil, let url = sessionUrl else { return }
        self.setAssuranceSessionUrl(withUrl: url)
    }
    
    public func setAssuranceSessionUrl(withUrl: String) {
        if let url = URL(string: withUrl) {
            Assurance.startSession(url: url)
        }
    }
    
    public func trackEvent(with eventType: TrackEvent, sourceName: ScreenName, customeData: [String : Any]?) {
        
        switch eventType {
        case .action:
            MobileCore.track(action: "", data: customeData)
        case .state:
            MobileCore.track(state: "", data: customeData)
        
        }
    }

    func dummy(with sourceName: ScreenName) {
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
