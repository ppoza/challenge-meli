struct SearchResult: Codable {
    let paging: Paging
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case paging
        case products = "results"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
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


struct Sort: Codable {
    let id, name: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}

struct Paging: Codable {
    let total, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case offset, limit
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try container.decode(Int.self, forKey: .total)
        self.offset = try container.decode(Int.self, forKey: .offset)
        self.limit = try container.decode(Int.self, forKey: .limit)
    }
}



