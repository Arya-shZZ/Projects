import random
import os

GRID_SIZE = 5
DIRECTIONS = {"w": "north", "s": "south", "d": "east", "a": "west"}
GOAL = "goal"

class Agent:
    def __init__(self, x, y):
        """Initialize agent's position."""
        self.position = (x, y)

    def get_position(self):
        """Return the current position of the agent."""
        return self.position

    def set_position(self, x, y):
        """Update the agent's position."""
        self.position = (x, y)

    def perceive_label(self, grid):
        """Returns the label of the agent's current position."""
        x, y = self.position
        return grid[x][y]

class GridWorld:
    def __init__(self):
        """Initialize a 5x5 grid world with directional and goal labels."""
        self.grid = [[random.choice(["north", "south", "east", "west"]) for _ in range(GRID_SIZE)] for _ in range(GRID_SIZE)]
        
        self.grid[GRID_SIZE-1][GRID_SIZE-1] = GOAL
        self.agent = Agent(2, 2)  

    def print_grid(self):
        """Clears the screen and prints the updated grid with the agent's position."""
        os.system("cls" if os.name == "nt" else "clear") 
        for x in range(GRID_SIZE):
            row = []
            for y in range(GRID_SIZE):
                if (x, y) == self.agent.get_position():
                    row.append("A")  
                else:
                    row.append(self.grid[x][y][0].upper()) 
            print(" ".join(row))
        print()

    def move_agent(self, direction):
        """Moves the agent in the given direction while ensuring boundaries."""
        x, y = self.agent.get_position()
        new_x, new_y = x, y

        if direction == "north":
            new_x -= 1
        elif direction == "south":
            new_x += 1
        elif direction == "east":
            new_y += 1
        elif direction == "west":
            new_y -= 1

        if 0 <= new_x < GRID_SIZE and 0 <= new_y < GRID_SIZE:
            self.agent.set_position(new_x, new_y)

    def interactive_mode(self):
        """Allows the user to control the agent with keyboard inputs."""
        while True:
            self.print_grid()
            label = self.agent.perceive_label(self.grid)

            if label == GOAL:
                print("🎉 Agent reached the goal! Game Over.")
                break

            print("Use W (up), S (down), A (left), D (right) to move, or Q to quit.")
            move = input("Move: ").lower()

            if move == "q":
                print("Exiting the game. Goodbye! 👋")
                break  

            if move in DIRECTIONS:
                self.move_agent(DIRECTIONS[move])
            else:
                print("❌ Invalid input! Use W, A, S, D, or Q to quit.")

world = GridWorld()
world.interactive_mode()
