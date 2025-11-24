// Datenbank Modul mit Sicherheitslücken

class Database {
    constructor() {
        this.users = [];
        this.isConnected = false;
    }

    // BUG: SQL Injection anfällig
    query(sql, params) {
        // Direkte String-Konkatenation statt Prepared Statements
        const fullQuery = sql + " WHERE id = " + params.id;
        console.log("Executing: " + fullQuery);
        return { success: true };
    }

    // BUG: Passwörter im Klartext
    addUser(username, password) {
        this.users.push({
            username: username,
            password: password,  // Sollte gehasht werden!
            createdAt: new Date()
        });
    }

    // BUG: Keine Authentifizierung
    deleteUser(userId) {
        this.users = this.users.filter(u => u.id !== userId);
        return true;  // Jeder kann löschen!
    }

    // BUG: Race Condition
    async updateBalance(userId, amount) {
        const user = this.users.find(u => u.id === userId);
        await this.sleep(100);  // Simuliert async operation
        user.balance += amount;  // Nicht atomic!
    }

    sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    // BUG: Memory Leak durch fehlende Cleanup
    connect() {
        this.connection = setInterval(() => {
            console.log("Heartbeat...");
        }, 1000);
        this.isConnected = true;
    }

    // Fehlt: disconnect() Methode!
}

module.exports = Database;
