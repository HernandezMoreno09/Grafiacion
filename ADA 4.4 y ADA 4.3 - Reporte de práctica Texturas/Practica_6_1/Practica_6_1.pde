// Lunar Landing Game

float x, y; // Position of the spaceship
float vx, vy; // Velocity of the spaceship
float ax, ay; // Acceleration of the spaceship
float gravity = 0.1; // Gravity force
float thrust = -0.2; // Force of the thruster
float platformX, platformWidth; // Landing platform position and width
boolean thrustOn = false; // Is the thruster on?
boolean gameOver = false; // Is the game over?

void setup() {
  size(400, 600);
  resetGame();
}

void resetGame() {
  // Initialize spaceship position
  x = random(50, width - 50);
  y = 50;
  vx = 0;
  vy = 0;
  ax = 0;
  ay = gravity;

  // Initialize platform position and size
  platformX = width / 2 - 30;
  platformWidth = 60;

  thrustOn = false;
  gameOver = false;
}

void draw() {
  background(0);

  if (!gameOver) {
    // Apply gravity and thrust
    ay = gravity + (thrustOn ? thrust : 0);

    // Update velocity and position
    vy += ay;
    vx += ax;
    y += vy;
    x += vx;

    // Constrain spaceship to screen boundaries
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);

    // Check for landing or crash
    if (y >= height - 20) {
      if (x > platformX && x < platformX + platformWidth && abs(vy) < 2) {
        println("Landing successful!");
      } else {
        println("Crash!");
      }
      gameOver = true;
    }
  }

  // Draw moon surface and landing platform
  fill(150);
  rect(0, height - 20, width, 20);
  fill(255, 0, 0);
  rect(platformX, height - 20, platformWidth, 20);

  // Draw spaceship as a rocket
  fill(200); // Body of the rocket
  triangle(x - 10, y - 20, x + 10, y - 20, x, y - 40); // Nose cone
  rect(x - 10, y - 20, 20, 40); // Body
  fill(150); // Fins
  triangle(x - 10, y + 20, x - 20, y + 40, x - 10, y + 40); // Left fin
  triangle(x + 10, y + 20, x + 20, y + 40, x + 10, y + 40); // Right fin

  // Draw thruster flame if active
  if (thrustOn) {
    fill(255, 100, 0);
    triangle(x - 5, y + 20, x + 5, y + 20, x, y + 40);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      thrustOn = true;
    } else if (keyCode == LEFT) {
      vx = -2;
    } else if (keyCode == RIGHT) {
      vx = 2;
    }
  }
}

void keyReleased() {
  if (key == CODED && keyCode == UP) {
    thrustOn = false;
  }
  if (key == CODED && (keyCode == LEFT || keyCode == RIGHT)) {
    vx = 0;
  }
}
