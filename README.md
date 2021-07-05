# Knights Travails

In this project, the user inputs two coordinates; a start and an end / target. The program counts and then outputs one of the shortest paths the Knight may take.

In this particularly challenging project, I learned to:

* **Recursively** build a **general tree** to store the possible paths the Knight may take to reach the target coordinate
* Use a **first-in first-out queue** to keep track of nodes to be visited when building the tree
* Perform a **level-order traversal** to return the node containing the target coordinates (which, in turn, also helps locate the shortest path)
* Store all of the possible moves in an **adjacency list** (represented by an array returned by GameBoard's `#all_possible_moves` method)
* Create **multidimensional arrays** (to store coordinates & all possible moves)
* Organize game components into separate **classes**
* Create **nodes** and **reference other nodes** within the nodes
* Track the **reference to predecessor nodes** for each node (leading to the root node, which would contain the user-inputted start coordinate)
