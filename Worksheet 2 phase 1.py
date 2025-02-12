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

class Leaf:
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
        self.leaf = self.reset_leaf() 
    
    def reset_leaf(self):
        while True:
            x = random.randint(0, self.width - 1)
            y = random.randint(0, self.height - 1)
            if (x, y) != (self.agent.x, self.agent.y):
                return Leaf(x, y)

    def is_valid_position(self, x, y):
        return 0 <= x < self.width and 0 <= y < self.height
    
    def move_agent(self, direction, pass_through_leaf=True):
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
            
        if not self.is_valid_position(new_x, new_y):
            return
            
        if self.leaf.active and (new_x, new_y) == self.leaf.get_position():
            if pass_through_leaf:
                self.leaf.active = False
                print("Leaf collected!")
                self.leaf = self.reset_leaf() 
                self.agent.set_position(new_x, new_y)
            else:
                leaf_new_x = new_x + (new_x - current_x)
                leaf_new_y = new_y + (new_y - current_y)
                
                if self.is_valid_position(leaf_new_x, leaf_new_y):
                    self.leaf.x = leaf_new_x
                    self.leaf.y = leaf_new_y
                    self.agent.set_position(new_x, new_y)
                else:
                    self.leaf.active = False
                    self.agent.set_position(new_x, new_y)
        else:
            self.agent.set_position(new_x, new_y)
    
    def display(self):
        for y in range(self.height):
            for x in range(self.width):
                if (x, y) == self.agent.get_position():
                    print('A', end=' ')
                elif self.leaf.active and (x, y) == self.leaf.get_position():
                    print('L', end=' ')
                else:
                    print('.', end=' ')
            print()
        if not self.leaf.active:
            print("The leaf has been collected!")

world = GridWorld(5, 5)
print("Initial state:")
world.display()

print("\nMoving east (passing through leaf):")
world.move_agent("east")
world.display()

world = GridWorld(5, 5)
print("\nMoving east (leaf as obstacle):")
world.move_agent("east", pass_through_leaf=False)
world.display()
