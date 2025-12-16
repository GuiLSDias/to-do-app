//
//  taskCoreDataRepository.swift
//  tasklist
//
//  Created by Guilherme Dias on 16/12/25.
//

import Foundation
import CoreData

final class TaskCoreDataRepository: TaskUseCase {

    private let context = CoreDataStack.shared.context

    func loadTasks() -> [Task] {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "createdAt", ascending: false)
        ]

        let entities = (try? context.fetch(request)) ?? []
        return entities.map { $0.toDomain() }
    }

    func addTask(_ task: Task) {
        let entity = TaskEntity(context: context)
        entity.update(from: task)
        entity.createdAt = Date()
        CoreDataStack.shared.save()
    }

    func toggleTask(_ task: Task) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)

        if let entity = try? context.fetch(request).first {
            entity.isCompleted.toggle()
            CoreDataStack.shared.save()
        }
    }

    func deleteTask(_ task: Task) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)

        if let entity = try? context.fetch(request).first {
            context.delete(entity)
            CoreDataStack.shared.save()
        }
    }
}
