//
//  tasklistApp.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import SwiftUI

@main
struct TaskListApp: App {

    var body: some Scene {
        WindowGroup {
            appCoordinator().start()
        }
    }
}
