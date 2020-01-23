
			var listElement = document.querySelector('#app ol');
			var inputElement = document.querySelector('#app input');
			var buttonElement = document.querySelector('#app button');

			var tarefas = JSON.parse(localStorage.getItem('list_todos'));

			function renderTodos() {

				listElement.innerHTML = '';
				

				for (tarefa of tarefas) {
					var todoElement = document.createElement('li');
					todoElement.setAttribute('id', 'item_tarefa');
					var todoText = document.createTextNode(tarefa);
					

					var remover_tarefa = document.createElement('a');
					remover_tarefa.setAttribute('href', '#');
					remover_tarefa.setAttribute('class', 'btn btn-outline-danger excluir_tarefa');


					var arquivar_tarefa = document.createElement('a');
					arquivar_tarefa.setAttribute('href', '#');
					arquivar_tarefa.setAttribute('class', 'btn btn-outline-success arquivar_tarefa');

					var pos = tarefas.indexOf(tarefa);
					remover_tarefa.setAttribute('onclick', 'deleteTodo(' + pos + ')');
					arquivar_tarefa.setAttribute('onclick', 'arquivarTodo(' + pos + ')');

					

					var linkExcluir = document.createTextNode('Excluir');
					var linkArquivar = document.createTextNode('feito');

					remover_tarefa.appendChild(linkExcluir);
					arquivar_tarefa.appendChild(linkArquivar);

					todoElement.appendChild(todoText);
					todoElement.appendChild(arquivar_tarefa);
					todoElement.appendChild(remover_tarefa);
					
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
				alert("esta tarefa será exluida");
				tarefas.splice(pos, 1);
				renderTodos();
				saveToStorage();
			}

			function arquivarTodo(pos) {
				alert("esta tarefa será arquivada");

				
			}

			function saveToStorage(){
				localStorage.setItem('list_todos', JSON.stringify(tarefas));
			}
			

