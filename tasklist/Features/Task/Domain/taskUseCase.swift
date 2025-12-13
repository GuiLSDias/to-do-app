//
//  taskUseCase.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import Foundation

protocol TaskUseCase {
    func loadTasks() -> [Task]
    func addTask(_ task: Task)
    func toggleTask(_ task: Task)
    func deleteTask(_ task: Task)
}
