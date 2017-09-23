//
//  FileSystem.swift
//  codegenv
//
//  Created by Bernardo Breder on 12/11/16.
//
//

import Foundation

public protocol FileSystem {
    
    func cwd() throws -> Folder
    
    func home() throws -> Folder
    
    func folder(_ path: String) -> Folder
    
    func file(_ path: String) -> File
    
}

public enum FileSystemError: Error {
    case fileNotFound(String)
    case fileAlreadyExist(String)
    case folderNotEmpty(String)
    case openFolder(String)
    case openFile(String)
    case readFolder(String)
    case currentWorkingFolder
    case createFile(String)
    case createFolder(String)
    case readFile(String)
    case writeFile(String)
    case removeFile(String)
    case removeFolder(String)
    case fileSystemCollected
    case invalidPath(String)
    case utf8
    case structuralBug
}
