//
//  taskEntityMapping.swift
//  tasklist
//
//  Created by Guilherme Dias on 16/12/25.
//

import Foundation
import CoreData

extension TaskEntity {
    func toDomain() -> Task{
        Task(
            id: id ?? UUID(),
            title: title ?? "",
            isCompleted: isCompleted
        )
    }
    
    func update(from task: Task){
        id = task.id
        title = task.title
        isCompleted = task.isCompleted
    }
}
