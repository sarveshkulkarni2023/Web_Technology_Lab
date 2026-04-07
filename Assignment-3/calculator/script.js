const display = document.getElementById("display");
const buttons = document.querySelectorAll(".btn");


let currentValue = "0";
let previousValue = null;
let operator = null;
let resetDisplay = false;


function updateDisplay() {
    display.textContent = currentValue;
}


buttons.forEach(button => {
    button.addEventListener("click", () => {
        const number = button.dataset.number;
        const action = button.dataset.action;


        if (number !== undefined) {
            inputNumber(number);
        } else if (action) {
            handleAction(action);
        }


        updateDisplay();
    });
});


function inputNumber(num) {
    if (currentValue === "0" || resetDisplay) {
        currentValue = num;
        resetDisplay = false;
    } else {
        currentValue += num;
    }
}


function handleAction(action) {
    switch (action) {
        case "clear":
            clearAll();
            break;
        case "plus-minus":
            toggleSign();
            break;
        case "percent":
            percentage();
            break;
        case "decimal":
            addDecimal();
            break;
        case "add":
        case "subtract":
        case "multiply":
        case "divide":
            setOperator(action);
            break;
        case "equals":
            calculate();
            break;
    }
}

function clearAll() {
    currentValue = "0";
    previousValue = null;
    operator = null;
}


function toggleSign() {
    if (currentValue !== "0") {
        currentValue = (parseFloat(currentValue) * -1).toString();
    }
}


function percentage() {
    currentValue = (parseFloat(currentValue) / 100).toString();
}


function addDecimal() {
    if (!currentValue.includes(".")) {
        currentValue += ".";
    }
}


function setOperator(op) {
    if (operator !== null) {
        calculate();
    }


    previousValue = currentValue;
    operator = op;
    resetDisplay = true;
}


function calculate() {
    if (operator === null || previousValue === null) return;


    let result;
    const prev = parseFloat(previousValue);
    const current = parseFloat(currentValue);


    switch (operator) {
        case "add":
            result = prev + current;
            break;
        case "subtract":
            result = prev - current;
            break;
        case "multiply":
            result = prev * current;
            break;
        case "divide":
            result = prev / current;
            break;
    }


    currentValue = result.toString();
    operator = null;
    previousValue = null;
}