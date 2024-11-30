import Foundation


struct Restaurant: Identifiable, Codable {
    let id: String
    let name: String
    let locality: String
    let areaName: String
    let costForTwo: String
    let cuisines: [String]
    let avgRating: Double
    let totalRatingsString: String
    let deliveryTime: Int
    let lastMileTravel: Double
    let slaString: String
    let lastMileTravelString: String
    let isOpen: Bool
    let cloudinaryImageId: String
}


struct RestaurantResponse: Codable {
    let statusCode: Int
    let statusMessage: String
    let data: RestaurantData
}

struct RestaurantData: Codable {
    let restaurants: [Restaurant]
}

