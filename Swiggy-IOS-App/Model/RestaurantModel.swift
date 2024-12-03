import Foundation

struct Restaurant: Codable, Identifiable {
    let id: String
    let name: String
    let locality: String
    let areaName: String
    let costForTwo: String
    let cuisines: [String]
    let avgRating: Double
    let deliveryTime: Int
    let lastMileTravelString: String
    let cloudinaryImageId: String
    
        enum CodingKeys: String, CodingKey {
        case id
        case name
        case locality
        case areaName
        case costForTwo
        case cuisines
        case avgRating
        case deliveryTime
        case lastMileTravelString
        case cloudinaryImageId
    }
}


struct Banner: Codable, Identifiable{
        let id : String
        let imageId : String
        let text : String
}
