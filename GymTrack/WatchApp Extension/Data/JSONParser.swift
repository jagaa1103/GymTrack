
import Foundation

enum MessageType {
    case greeting
    case data
}

struct Message <T: Codable> {
    var data: T
}

protocol JSONParserProtocol {
    func toJSON<T: Codable>(items: [T])-> String?
}

extension JSONParserProtocol {
    func toJSON<T: Codable>(items: T)-> String? {
        do {
            let json = try JSONEncoder().encode(items)
            return String(data: json, encoding: .utf8)
        }catch{
            return nil
        }
    }
}
