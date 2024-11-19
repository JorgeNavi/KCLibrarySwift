import Foundation
import Security
import KeychainSwift

public struct KeyChainKC {
    
    @discardableResult public func saveKC(_ key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let keychain = KeychainSwift()
            return keychain.set(data, forKey: key)
        } else {
            return false
        }
        
    }
    
    public func loadKC(_ key: String) -> String? {
        let keychain = KeychainSwift()
        if let data = keychain.get(key) {
            return data
        } else {
            return ""
        }
    }
    
    @discardableResult public func deleteKC(_ key: String) -> Bool {
        let keychain = KeychainSwift()
        return keychain.delete(key)
    }
}
