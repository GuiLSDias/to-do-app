//
//  taskRepository.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import Foundation

final class TaskRepository: TaskUseCase{
    private var tasks: [Task] = []
    
    
    func loadTasks() -> [Task] {
        return tasks
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func toggleTask(_ task: Task) {
        guard let index = tasks.firstIndex(where: {$0.id == task.id}) else {return}
        tasks[index].isCompleted.toggle()
    }
    
    func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
}
