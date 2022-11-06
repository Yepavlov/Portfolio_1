
window.addEventListener('load', function () {
    const createTodoButton = document.querySelector('#todo-button');
    const newTodo = document.querySelector('#todo');
    const todoList = document.querySelector('#todo-list');
    const changeButton = document.querySelector('#change-button');
    const body = this.document.getElementById("body");
    var color = body.style.backgroundColor;
    var colors = todoList.style.color;



    changeButton.addEventListener('click', function () {
      color = body.style.backgroundColor = color === 'black' ? 'white' : 'black';
      colors = todoList.style.color = colors === 'white' ? 'black' : 'white';
    });
         
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4) {
          const todos = JSON.parse(xhr.response).todos;
          for (let i = 0; i < todos.length; i++) {
            let li = document.createElement('li');
            li.innerText = todos[i];
            todoList.appendChild(li);
          }
        }
      }
    xhr.open("GET", "/api/todos", true);
    xhr.send();
    
    
    createTodoButton.addEventListener('click', function () {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/api/todos", true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({
            todo: newTodo.value
        }));

        let li = document.createElement('li');
        li.innerText = newTodo.value;
        todoList.appendChild(li);
        newTodo.value = '';

    });
});