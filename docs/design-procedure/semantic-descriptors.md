# To Do Hypermedia API

## The list of semantic descriptors is the first step to designing a hypermedia API.

    List all the pieces of information a client might want to get out of your API or
    put into your API. These will become your semantic descriptors. 

* A list of todos
* A list of complete todos: could be gotten from list of all todos
* A list of pending todos: could be gotten from list of all todos
* A todo
  * Text description
  * Completeness status: complete or pending
  * A control for editing text description
  * A (toggle) control for marking a todo complete or pending
  * A control to delete the todo
* A form for creating a new, pending todo

## Hierarchical listing

    Semantic descriptors tend to form hierarchies. Group your descriptors together in 
    ways that make intuitive sense.

* A list of todos
  * A todo
    * Description
    * Description edit control (update)
    * Completeness status
    * Completeness toggle control (update)
    * Delete ToDo (delete)
  * A form for creating a new todo

