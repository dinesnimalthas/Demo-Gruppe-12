// Medium feature example - for M PRs
// This represents a medium-sized feature with multiple functions

class TaskManager {
    constructor() {
        this.tasks = [];
        this.nextId = 1;
    }

    addTask(title, description, priority = 'medium') {
        const task = {
            id: this.nextId++,
            title: title,
            description: description,
            priority: priority,
            completed: false,
            createdAt: new Date(),
            updatedAt: new Date()
        };
        this.tasks.push(task);
        return task;
    }

    getTask(id) {
        return this.tasks.find(task => task.id === id);
    }

    getAllTasks() {
        return [...this.tasks];
    }

    updateTask(id, updates) {
        const task = this.getTask(id);
        if (!task) {
            throw new Error(`Task with id ${id} not found`);
        }
        Object.assign(task, updates, { updatedAt: new Date() });
        return task;
    }

    deleteTask(id) {
        const index = this.tasks.findIndex(task => task.id === id);
        if (index === -1) {
            throw new Error(`Task with id ${id} not found`);
        }
        return this.tasks.splice(index, 1)[0];
    }

    completeTask(id) {
        const task = this.getTask(id);
        if (!task) {
            throw new Error(`Task with id ${id} not found`);
        }
        task.completed = true;
        task.completedAt = new Date();
        task.updatedAt = new Date();
        return task;
    }

    getTasksByPriority(priority) {
        return this.tasks.filter(task => task.priority === priority);
    }

    getCompletedTasks() {
        return this.tasks.filter(task => task.completed);
    }

    getPendingTasks() {
        return this.tasks.filter(task => !task.completed);
    }

    searchTasks(query) {
        const lowerQuery = query.toLowerCase();
        return this.tasks.filter(task => 
            task.title.toLowerCase().includes(lowerQuery) ||
            task.description.toLowerCase().includes(lowerQuery)
        );
    }

    sortTasksByDate(ascending = true) {
        return [...this.tasks].sort((a, b) => {
            const dateA = a.createdAt.getTime();
            const dateB = b.createdAt.getTime();
            return ascending ? dateA - dateB : dateB - dateA;
        });
    }

    sortTasksByPriority() {
        const priorityOrder = { 'high': 1, 'medium': 2, 'low': 3 };
        return [...this.tasks].sort((a, b) => {
            return priorityOrder[a.priority] - priorityOrder[b.priority];
        });
    }

    getStatistics() {
        const total = this.tasks.length;
        const completed = this.getCompletedTasks().length;
        const pending = this.getPendingTasks().length;
        const high = this.getTasksByPriority('high').length;
        const medium = this.getTasksByPriority('medium').length;
        const low = this.getTasksByPriority('low').length;

        return {
            total,
            completed,
            pending,
            completionRate: total > 0 ? (completed / total * 100).toFixed(2) : 0,
            byPriority: { high, medium, low }
        };
    }

    clearCompleted() {
        const completed = this.getCompletedTasks();
        this.tasks = this.getPendingTasks();
        return completed;
    }

    clearAll() {
        const removed = [...this.tasks];
        this.tasks = [];
        this.nextId = 1;
        return removed;
    }

    exportTasks() {
        return JSON.stringify(this.tasks, null, 2);
    }

    importTasks(jsonString) {
        try {
            const imported = JSON.parse(jsonString);
            if (!Array.isArray(imported)) {
                throw new Error('Invalid format: expected array');
            }
            this.tasks = imported.map(task => ({
                ...task,
                createdAt: new Date(task.createdAt),
                updatedAt: new Date(task.updatedAt),
                completedAt: task.completedAt ? new Date(task.completedAt) : null
            }));
            this.nextId = Math.max(...this.tasks.map(t => t.id), 0) + 1;
            return this.tasks.length;
        } catch (error) {
            throw new Error(`Import failed: ${error.message}`);
        }
    }
}

module.exports = TaskManager;
