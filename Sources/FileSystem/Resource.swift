//
//  Resource.swift
//  codegenv
//
//  Created by Bernardo Breder on 12/11/16.
//
//

import Foundation

public protocol Resource {
    
    var name: String { get }
    
    var exist: Bool { get }
    
    var parent: Folder? { get }
    
    var file: Bool { get }
    
    var folder: Bool { get }
    
    var canBeRead: Bool { get }
    
    var canBeWrite: Bool { get }
    
    @discardableResult
    func delete() throws -> Self
    
    @discardableResult
    func delete(deep: Bool) throws -> Self
    
    func asFile() -> File
    
    func asFolder() -> Folder
    
}

extension Resource {
    
    public var nameWithoutExtension: String {
        guard let range: Range = name.range(of: ".", options: .backwards) else { return name }
        return name.substring(to: range.lowerBound)
    }
    
    public var ext: String? {
        guard let range: Range = name.range(of: ".", options: .backwards) else { return nil }
        return name.substring(from: range.upperBound)
    }
    
    public var path: String {
        if let parent = self.parent {
            return parent.path + "/" + name
        } else { return "/" + name }
    }
    
}
