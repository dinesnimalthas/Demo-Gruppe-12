// Calculator mit absichtlichen Bugs für Testing

class Calculator {
    constructor() {
        this.result = 0;
        this.history = [];
    }

    // BUG: Division durch Null nicht behandelt
    divide(a, b) {
        return a / b;  // Sollte prüfen ob b === 0
    }

    // BUG: Keine Validierung der Eingabe
    add(a, b) {
        return a + b;  // Was passiert wenn a oder b nicht Zahlen sind?
    }

    // BUG: Infinite Loop Potential
    multiply(a, b) {
        let result = 0;
        let i = 0;
        // Fehlt Abbruchbedingung wenn b negativ
        while (i < b) {
            result += a;
            i++;
        }
        return result;
    }

    // BUG: Memory Leak - history wird nie geleert
    saveToHistory(operation, result) {
        this.history.push({
            operation: operation,
            result: result,
            timestamp: new Date()
        });
        // Fehlt: Begrenzung der History-Größe
    }

    // BUG: Unsichere String-Konkatenation
    formatResult(value) {
        return "Result: " + value;  // Keine Validierung
    }

    // BUG: Array.prototype Modifikation (schlechte Praxis)
    getAllResults() {
        Array.prototype.customMethod = function() {
            return this.map(x => x.result);
        };
        return this.history.customMethod();
    }
}

// BUG: Keine Error Handling
function calculate(operation, a, b) {
    const calc = new Calculator();
    
    switch(operation) {
        case 'add':
            return calc.add(a, b);
        case 'divide':
            return calc.divide(a, b);  // Kann zu Infinity führen
        case 'multiply':
            return calc.multiply(a, b);  // Kann hängen bleiben
        default:
            return null;  // Keine Exception
    }
}

// BUG: Unsichere eval Verwendung
function evaluateExpression(expression) {
    return eval(expression);  // SEHR gefährlich!
}

// BUG: Globale Variable
var globalCounter = 0;

// BUG: Blocking Operation
function longRunningTask() {
    for (let i = 0; i < 1000000000; i++) {
        globalCounter++;
    }
    return globalCounter;
}

// Beispiel Verwendung (mit Bugs)
console.log(calculate('divide', 10, 0));  // Infinity
console.log(calculate('add', '5', '3'));   // "53" statt 8
console.log(calculate('multiply', 5, -2)); // Infinite Loop!

module.exports = Calculator;
