//
//  MediaURLError.swift
//  Media
//
//  Created by Christian Elies on 08.12.19.
//

import Foundation

public enum MediaURLError: Error {
    case couldNotCreateFileType
    case missingPathExtension
    case unsupportedPathExtension
}