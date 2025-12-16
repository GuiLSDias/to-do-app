//
//  tasksCoordinator.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import Foundation
import SwiftUICore

final class TasksCoordinator {

    func start() -> some View {
        let repository = TaskCoreDataRepository()
        let viewModel = TasksViewModel(userCase: repository)
        return TasksListView(viewModel: viewModel)
    }
}
