//
//  Folder.swift
//  codegenv
//
//  Created by Bernardo Breder on 12/11/16.
//
//

import Foundation

public protocol Folder: Resource {
    
    func list() throws -> [Resource]
    
    func listFiles() throws -> [File]
    
    func listFolders() throws -> [Folder]
    
    func get(_ name: String) throws -> Resource
    
    func getFile(_ name: String) -> File
    
    func getFolder(_ name: String) -> Folder
    
    func find(_ name: String) throws -> Resource?
    
    func findFile(_ name: String) throws -> File?
    
    func findFolder(_ name: String) throws -> Folder?
    
    func createFile(_ name: String, data: Data) throws -> File
    
    func createFolder(_ name: String) throws -> Folder
    
    func create() throws
    
    @discardableResult
    func createIfNotExist() throws -> Self
    
    @discardableResult
    func deleteFile(_ name: String) throws -> Self
    
    @discardableResult
    func deleteFolder(_ name: String, deep: Bool) throws -> Self
    
}
