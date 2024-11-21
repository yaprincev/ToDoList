//
//  CoreDataService.swift
//  ToDoList
//
//  Created by student on 21.11.2024.
//

import CoreData
import UIKit
 
final class CoreDataService: CoreDataServiceProtocol {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext) {
        self.context = context
    }
    
    func fetchTasks() -> [ToDoModel] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            let tasks = try context.fetch(request)
            return tasks.map { ToDoModel(coreDataTask: $0) }
        } catch {
            print("Failed to fetch tasks from Core Data: \(error)")
            return []
        }
    }
    
    func saveTask(_ task: ToDoModel) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", task.id)
        
        do {
            let existingTasks = try context.fetch(fetchRequest)
            if let existingTask = existingTasks.first {
                existingTask.title = task.todo
                existingTask.taskDescription = task.description ?? ""
                existingTask.completed = task.completed
                existingTask.createdDate = task.date
            } else {
                let newTask = Task(context: context)
                newTask.id = Int64(task.id)
                newTask.title = task.todo
                newTask.taskDescription = task.description ?? ""
                newTask.completed = task.completed
                newTask.createdDate = task.date
            }
            saveContext()
        } catch {
            print("Failed to save task: \(error)")
        }
    }
     
    
    func deleteTask(with id: Int) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        do {
            let tasks = try context.fetch(request)
            for task in tasks {
                context.delete(task)
            }
            saveContext()
        } catch {
            print("Failed to delete task: \(error)")
        }
    }
    
    func updateTask(_ task: ToDoModel) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", task.id)
        do {
            let tasks = try context.fetch(request)
            if let coreDataTask = tasks.first {
                coreDataTask.title = task.todo
                coreDataTask.taskDescription = task.description
                coreDataTask.completed = task.completed
                saveContext()
            }
        } catch {
            print("Failed to update task: \(error)")
        }
    }

    func clearAllTasks() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Task.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
     
        do {
            try context.execute(deleteRequest)
            saveContext()
            print("All tasks cleared successfully.")
        } catch {
            print("Failed to clear Core Data: \(error)")
        }
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
