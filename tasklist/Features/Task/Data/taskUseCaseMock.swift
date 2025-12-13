//
//  taskUseCaseMock.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import Foundation


final class TaskUseCaseMock: TaskUseCase {

    private var tasks: [Task] = [
        Task(id: UUID(), title: "Estudar SwiftUI", isCompleted: false),
        Task(id: UUID(), title: "Criar TaskList", isCompleted: true),
        Task(id: UUID(), title: "Ir para a academia", isCompleted: false)
    ]

    func loadTasks() -> [Task] {
        tasks
    }

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func toggleTask(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
    }
    
    func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
}
