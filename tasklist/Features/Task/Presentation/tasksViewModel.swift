//
//  tasksViewModel.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import Foundation

final class TasksViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    var completedTasks: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    private let useCase: TaskUseCase
    
    init(userCase: TaskUseCase){
        self.useCase = userCase
        loadTasks()
    }
    
    func loadTasks(){
        tasks = useCase.loadTasks()
    }
    
    func addTask(title: String){
        let task = Task(id: UUID(), title: title, isCompleted: false)
        useCase.addTask(task)
        loadTasks()
    }
    
    func toggleTask(_ task: Task) {
            useCase.toggleTask(task)
            loadTasks()
        }
    func deleteTask(_ task: Task) {
        useCase.deleteTask(task)
        loadTasks()
    }
}
