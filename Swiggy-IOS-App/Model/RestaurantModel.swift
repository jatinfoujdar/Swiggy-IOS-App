import Foundation

struct RootData: Codable {
    let restaurants: [Restaurant]
    let banners: [Banner]
}

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
}

struct Banner: Codable, Identifiable {
    let id: String
    let imageId: String
    let text: String
}
