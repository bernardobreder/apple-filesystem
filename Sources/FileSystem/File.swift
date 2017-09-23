//
//  File.swift
//  codegenv
//
//  Created by Bernardo Breder on 12/11/16.
//
//

import Foundation

public protocol File: Resource {
    
    @discardableResult
    func create() throws -> Self
    
    @discardableResult
    func createIfNotExist() throws -> Self
    
    func read() throws -> Data
    
    @discardableResult
    func write(data: Data) throws -> Self
    
    @discardableResult
    func append(data: Data) throws -> Self
    
}

extension File {
    
    public func copy(_ target: Folder) throws {
        try target.getFile(name).write(data: try read())
    }
    
    public func copy(_ target: Folder, withName name: String) throws {
        try target.getFile(name).write(data: try read())
    }
    
    public func move(_ target: Folder) throws {
        try copy(target)
        try delete()
    }
    
}
