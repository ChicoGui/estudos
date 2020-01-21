
			var listElement = document.querySelector('#app ol');
			var inputElement = document.querySelector('#app input');
			var buttonElement = document.querySelector('#app button');

			var tarefas = JSON.parse(localStorage.getItem('list_todos'));

			function renderTodos() {

				listElement.innerHTML = '';

				for (tarefa of tarefas) {
					var todoElement = document.createElement('li');
					var todoText = document.createTextNode(tarefa);

					var linkElement = document.createElement('a');
					linkElement.setAttribute('href', '#');

					var pos = tarefas.indexOf(tarefa);
					linkElement.setAttribute('onclick', 'deleteTodo(' + pos + ')');

					

					var linkText = document.createTextNode(' Excluir');

					linkElement.appendChild(linkText);

					todoElement.appendChild(todoText);
					todoElement.appendChild(linkElement);

					listElement.appendChild(todoElement);
				}
			}

			renderTodos()

			function addTodo() {
				var todoText = inputElement.value;

				if (inputElement.value != ''){

					tarefas.push(todoText);
					inputElement.value = '';
					renderTodos();
					saveToStorage();
				}
			}

			buttonElement.onclick = addTodo;

			function deleteTodo(pos) {
				tarefas.splice(pos, 1);
				renderTodos();
				saveToStorage();
			}

			function saveToStorage(){
				localStorage.setItem('list_todos', JSON.stringify(tarefas));
			}
			

