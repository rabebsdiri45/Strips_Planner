from collections import deque
import searchspace

def depth_first_search(planning_task):
    """
    Searches for a plan on the given task using depth first search and
    duplicate detection.

    @param planning_task: The planning task to solve.
    @return: The solution as a list of operators or None if the task is
    unsolvable.
    """
    # Stack for storing the nodes which are next to explore
    stack = deque()
    stack.append(searchspace.make_root_node(planning_task.initial_state))
    # Set for storing the explored nodes, used for duplicate detection
    closed = {planning_task.initial_state}

    while stack:
        # Get the next node to explore (LIFO)
        node = stack.pop()

        # Exploring the node or if it is a goal node extracting the plan
        if planning_task.goal_reached(node.state):
            return node.extract_solution()

        for operator, successor_state in planning_task.get_successor_states(node.state):
            # Duplicate detection
            if successor_state not in closed:
                stack.append(
                    searchspace.make_child_node(node, operator, successor_state)
                )
                # Remember the successor state
                closed.add(successor_state)

    return None

