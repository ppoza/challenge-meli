//
//  Product.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//
enum ProductAttributeID: String {
    case brand = "BRAND"
    case color = "COLOR"
    case model = "MODEL"
}


struct Product: Codable {
    let id: String
    let title: String
    let thumbnail: String?
    let price: Double?
    let originalPrice: Double?
    let attributes: [Attribute]?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case originalPrice = "original_price"
        case price
        case attributes
    }
    
    init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       self.id = try container.decode(String.self, forKey: .id)
       self.title = try container.decode(String.self, forKey: .title)
       self.thumbnail = try? container.decode(String.self, forKey: .thumbnail)
       self.price = try? container.decode(Double.self, forKey: .price)
       self.originalPrice = try? container.decode(Double.self, forKey: .originalPrice)
       self.attributes = try? container.decode([Attribute].self, forKey: .attributes)
   }
}

extension Product {
    func toViewModel() -> ProductViewModel {
        return ProductViewModel(product: self)
    }
    
    func getAttributeValue(for key: ProductAttributeID) -> String? {
        return attributes?.first(where: { $0.id == key.rawValue })?.value
    }
}

struct Attribute: Codable {
    let id: String
    let value: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.value = try container.decode(String.self, forKey: .value)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case value = "value_name"
    }
}
