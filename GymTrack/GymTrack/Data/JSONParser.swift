
import Foundation

enum MessageType {
    case greeting
    case data
}

struct Message <T: Codable> {
    var data: T
}

protocol JSONParserProtocol {
}

extension JSONParserProtocol {
    func jsonToString<T: Codable>(items: T)-> String? {
        do {
            let json = try JSONEncoder().encode(items)
            return String(data: json, encoding: .utf8)
        }catch{
            return nil
        }
    }
    
    func stringToJSON<T: Codable>(string: String, type: T.Type) -> T? {
        do{
            guard let m = string.data(using: .utf8) else {
                return nil
            }
            let d = try JSONDecoder().decode(T.self, from: m)
            return d
        }catch{
            fatalError(error.localizedDescription)
        }
    }
    
    func dataToJSON<T: Codable>(data: Data) -> T? {
        do{
            let d = try JSONDecoder().decode(T.self, from: data)
            return d
        }catch{
            Logger.instance.log(tag: "JSONParser", message: error.localizedDescription)
            return nil
        }
    }
}
