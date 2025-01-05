import Foundation

enum ApiKey {
    static var `default`: String {
        guard let filePath = Bundle.main.url(forResource: "GenerativeInfo", withExtension: "plist")
        else {
            fatalError("Couldn't find file 'GenerativeInfo.plist'")
        }
        guard let plist = NSDictionary(contentsOf: filePath),
              let value = plist.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find 'API_KEY' in 'GenerativeInfo.plist'")
        }
        if value.starts(with: "_") {
            fatalError("Follow the instructions at google.dev/tutorials/setup to get an API key.")
        }
        return value
    }
}
