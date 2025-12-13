//
//  tasksListView.swift
//  tasklist
//
//  Created by Guilherme Dias on 12/12/25.
//

import SwiftUI

import SwiftUI

struct TasksListView: View {

    @StateObject var viewModel: TasksViewModel
    @State private var newTaskTitle: String = ""

    var body: some View {
        VStack(spacing: 24) {

            header

            addTaskSection

            summarySection

            contentSection

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    let mock = TaskUseCaseMock()
    let viewModel = TasksViewModel(userCase: mock)
    TasksListView(viewModel: viewModel)
}


private extension TasksListView {

    var header: some View {
        HStack(spacing: 8) {
            Image(systemName: "rocket.fill")
                .foregroundColor(.purple)

            Text("todo")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.green, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
        .padding(.top, 16)
    }
}

private extension TasksListView {

    var addTaskSection: some View {
        HStack(spacing: 12) {

            TextField("Adicione uma nova tarefa", text: $newTaskTitle)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)

            Button {
                guard !newTaskTitle.isEmpty else { return }
                viewModel.addTask(title: newTaskTitle)
                newTaskTitle = ""
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .frame(width: 48, height: 48)
                    .background(Color.purple)
                    .cornerRadius(12)
            }
        }
    }
}


private extension TasksListView {

    var summarySection: some View {
        HStack {
            HStack(spacing: 6) {
                Text("Tarefas criadas")
                Text("\(viewModel.tasks.count)")
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .background(Color.purple.opacity(0.2))
                    .cornerRadius(10)
            }

            Spacer()

            HStack(spacing: 6) {
                Text("Concluídas")
                Text("\(viewModel.completedTasks)")
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
    }
}

private extension TasksListView {

    @ViewBuilder
    var contentSection: some View {
        if viewModel.tasks.isEmpty {
            emptyState
        } else {
            taskList
        }
    }
}

private extension TasksListView {

    var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "clipboard")
                .font(.largeTitle)
                .foregroundColor(.purple.opacity(0.5))

            Text("Você ainda não tem tarefas cadastradas")
                .fontWeight(.semibold)

            Text("Crie tarefas e organize seus itens a fazer")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}


private extension TasksListView {

    var taskList: some View {
        List {
            ForEach(viewModel.tasks) { task in
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)

                    Text(task.title)
                        .strikethrough(task.isCompleted)
                        .foregroundColor(task.isCompleted ? .secondary : .primary)

                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.toggleTask(task)
                }
                .swipeActions(edge: .trailing) {
                                  Button(role: .destructive) {
                                      viewModel.deleteTask(task)
                                  } label: {
                                      Label("Excluir", systemImage: "trash")
                                  }
                              }            }
        }
        .listStyle(.plain)
    }
}
