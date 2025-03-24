struct SearchResult: Codable {
    let siteID: String
    let query: String
    let paging: Paging
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query
        case paging
        case products = "results"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.siteID = try container.decode(String.self, forKey: .siteID)
        self.query = try container.decode(String.self, forKey: .query)
        self.paging = try container.decode(Paging.self, forKey: .paging)
        self.products = try container.decode([Product].self, forKey: .products)
    }
}

struct AvailableFilterValue: Codable {
    let id, name: String
    let results: Int

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.results = try container.decode(Int.self, forKey: .results)
    }
}

enum TypeEnum: String, Codable {
    case boolean = "boolean"
    case number = "number"
    case range = "range"
    case string = "STRING"
    case text = "text"
}


// MARK: - Sort
struct Sort: Codable {
    let id, name: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}

struct Paging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try container.decode(Int.self, forKey: .total)
        self.primaryResults = try container.decode(Int.self, forKey: .primaryResults)
        self.offset = try container.decode(Int.self, forKey: .offset)
        self.limit = try container.decode(Int.self, forKey: .limit)
    }
}



