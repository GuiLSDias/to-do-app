//
//  appCoordinator.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import Foundation
import SwiftUICore
final class appCoordinator {
    func start() -> some View {
        TasksCoordinator().start()
    }
}
