//
//  task.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//
import Foundation
struct Task: Identifiable, Codable{
    let id: UUID
    var title: String
    var isCompleted: Bool
}
