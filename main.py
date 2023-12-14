import argparse
from pddl.parser import Parser
from grounding import ground
from breadth_first_search import breadth_first_search
from depth_first_search import depth_first_search

def _parse(domain_file, problem_file):
    # Parsing
    parser = Parser(domain_file, problem_file)
    domain = parser.parse_domain()
    problem = parser.parse_problem(domain)
    return problem

def _ground(problem, remove_statics_from_initial_state=True, remove_irrelevant_operators=True):
    task = ground(problem, remove_statics_from_initial_state, remove_irrelevant_operators)
    return task

def main(domain_file, task_file):
    problem = _parse(domain_file, task_file)
    task = _ground(problem)
    #solution = depth_first_search(task)
    solution = breadth_first_search(task)
    if solution:
        for sol in solution:
            print(sol)
    else:
        print("No solution found.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run PDDL Planning")
    parser.add_argument("domain_file", help="Path to the domain file")
    parser.add_argument("task_file", help="Path to the task file")

    args = parser.parse_args()
    main(args.domain_file, args.task_file)


