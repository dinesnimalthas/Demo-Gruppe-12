// API Handler mit diversen Problemen

const express = require('express');

class APIHandler {
    constructor() {
        this.app = express();
        this.setupRoutes();
    }

    setupRoutes() {
        // BUG: Keine CORS-Einstellungen
        // BUG: Keine Rate Limiting
        // BUG: Keine Input Validation

        // BUG: Keine Authentifizierung
        this.app.get('/api/users/:id', (req, res) => {
            const userId = req.params.id;
            // Direkte Datenbankabfrage ohne Validierung
            const user = this.getUser(userId);
            res.json(user);  // Gibt sensible Daten zurück
        });

        // BUG: POST ohne CSRF-Schutz
        this.app.post('/api/users', (req, res) => {
            const { username, email, role } = req.body;
            // Jeder kann sich als Admin registrieren!
            this.createUser(username, email, role);
            res.json({ success: true });
        });

        // BUG: Path Traversal Vulnerability
        this.app.get('/api/files/:filename', (req, res) => {
            const filename = req.params.filename;
            const filepath = './uploads/' + filename;  // Unsicher!
            res.sendFile(filepath);
        });

        // BUG: Unhandled Promise Rejection
        this.app.get('/api/async', async (req, res) => {
            const data = await this.fetchData();  // Kein try-catch
            res.json(data);
        });
    }

    // BUG: Synchrone Blockierung
    getUser(id) {
        let user = null;
        for (let i = 0; i < this.users.length; i++) {
            if (this.users[i].id === id) {
                user = this.users[i];
                break;
            }
        }
        return user;
    }

    // BUG: Keine Validierung
    createUser(username, email, role) {
        this.users.push({
            id: this.users.length + 1,  // Schwache ID-Generierung
            username: username,
            email: email,
            role: role  // Keine Validierung!
        });
    }

    async fetchData() {
        throw new Error("Not implemented");  // Wird nicht gefangen
    }

    // BUG: Kein Graceful Shutdown
    start(port) {
        this.app.listen(port, () => {
            console.log(`Server läuft auf Port ${port}`);
        });
    }
}

module.exports = APIHandler;
