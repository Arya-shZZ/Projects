import random

class Agent:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def get_position(self):
        return (self.x, self.y)
    
    def set_position(self, x, y):
        self.x = x
        self.y = y
    
    def idle(self):
        print(f"Agent is idle at position: {self.get_position()}")

class Flower:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.active = True 
    
    def get_position(self):
        return (self.x, self.y) if self.active else None

class GridWorld:
    def __init__(self, width, height):
        self.width = width
        self.height = height
        self.agent = Agent(width // 2, height // 2)
        self.flower = self.reset_flower() 
    
    def reset_flower(self):
        while True:
            x = random.randint(0, self.width - 1)
            y = random.randint(0, self.height - 1)
            if (x, y) != (self.agent.x, self.agent.y):
                return Flower(x, y)

    def move_agent(self, direction):
        current_x, current_y = self.agent.get_position()
        new_x, new_y = current_x, current_y
        
        if direction == "north":
            new_y -= 1
        elif direction == "south":
            new_y += 1
        elif direction == "east":
            new_x += 1
        elif direction == "west":
            new_x -= 1
            
        if 0 <= new_x < self.width and 0 <= new_y < self.height:
            self.agent.set_position(new_x, new_y)
        else:
            print("Agent cannot move out of bounds.")

    def display(self):
        for y in range(self.height):
            for x in range(self.width):
                if (x, y) == self.agent.get_position():
                    print('A', end=' ')  
                elif self.flower.active and (x, y) == self.flower.get_position():
                    print('F', end=' ')  
                else:
                    print('.', end=' ')  
            print()

world = GridWorld(5, 5)
print("Initial state:")
world.display()

print("\nAgent is idle:")
world.agent.idle()

print("\nMoving east:")
world.move_agent("east")
world.display()
