// Concept:
// Connected squares/curves that form a shape similar to the Fibonacci spiral, except with inverted curves as the unit

// Instructions:
// Run the program to see some variations of the Fibonacci star!

// Sources:
// Link to GitHub repository for a Fibonacci spiral: https://gist.github.com/robot-dreams/b6e6196e671053917ec4b848c40e805b 

float randx = 0; //Variable for a random x coordinate
float randy = 0; //Variable for a random y coordinate
int randCurv = 0; //Variable for a random amount of curves for the star
float randScale = 0; //Variable for a random scalar
float randAngle = 0; //Variable for a random rotation angle
color randColour = color(0, 0, 0); //Variable for a random colour

void setup() {
  size(800, 800); //Sets the size of the screen to 800x800 pixels
  rectMode(CORNER); //Sets the method for rectangle placement to be based on the rect's corner
  strokeWeight(5); //Sets the stroke thickness to be five pixels
  noFill(); //Sets the fill colour to be nothing
  
  randx = random(0, width); //Calculates random x coordinate
  randy = random(0, height); //Calculates random y coordinate
  randCurv = (int) random(1, 100); //Calculates random curve count (1 - 100)
  randScale = random(0.01, 100); //Calculates random scalar (0.01% - 10,000%)
  randAngle = random(0, TWO_PI); //Calculates random angle (0 degrees - 360 degrees)
  randColour = color(random(0, 255), random(0, 255), random(0, 255)); //Calculates random RGB colour
}

void draw() {
  background(255, 197, 153); //Sets the background to peach
  stroke(0); //Sets the stroke colour to black
  fibonacciStar(width / 2, height / 2, 12, 1, PI); //Draws Fibonacci star with given parameters
  stroke(230, 0, 0); //Sets the stroke colour to red
  fibonacciStar(width / 4, height / 4, 15, 0.5, HALF_PI); //Draws Fibonacci star with given parameters
  stroke(240, 240, 240); //Sets the stroke colour to white
  fibonacciStar(width - 50, height - 50, 15, 30, 0); //Draws Fibonacci star with given parameters
  stroke(19, 124, 17); //Sets the stroke colour to green
  fibonacciStar(width / 4, 3 * height / 4, 19, 0.25, 2 * PI); //Draws Fibonacci star with given parameters
  stroke(48, 83, 124); //Sets the stroke colour to blue
  fibonacciStar(3 * width / 4, height / 4 - 50, 4, 75, 3 * PI / 2); //Draws Fibonacci star with given parameters
  stroke(randColour); //Sets the stroke colour to a random colour
  fibonacciStar(randx, randy, randCurv, randScale, randAngle); //Draws Fibonacci star with random parameters
  
  noLoop(); //Allows the draw() method to run only once for efficiency (no animation)
} 

//Custom function to draw a Fibonacci star!
//Parameters: x coordinate, y coordinate, curve count, scale of shape, angle of rotation
void fibonacciStar(float x, float y, int curves, float scale, float angle) {
  color current = g.strokeColor; //Stores current stroke colour
  pushMatrix(); //Pushes current transformation matrix to program stack for future access
  float num = 1 * scale; //Start state of Fibonacci sequence, multiplied by the scalar
  float prevNum = 1 * scale; //Start state of Fibonacci sequence (previous element variable), multiplied by the scalar
  translate(x, y); //Translates drawing canvas to given x, y coordinates
  rotate(angle); //Rotates drawing canvas by given angle
  //Loop for each given curve
  for (int i = 0; i < curves; i++) {
    translate(num, 0); //Translates drawing canvas to the side to position current curve
    rotate(HALF_PI); //Rotates drawing canvas by PI / 2 radians (90 degrees) for curve direction
    stroke(red(current), green(current), blue(current), 60); //Sets stroke to a transparent variation of current colour
    rect(0, 0, prevNum, prevNum); //Draws transparent square around curve boundaries to represent current Fibonacci element
    stroke(current); //Changes stroke colour back to the solid colour
    arc(0, 0, 2 * prevNum - 2, 2 * prevNum - 2, 0, HALF_PI); //Draws inverted curve within the boundaries (connected to previous curve)
    num += prevNum; //Updates Fibonacci element
    prevNum = num - prevNum; //Updates previous Fibonacci element for future calculation
  }
  popMatrix(); //Reverts to original transformation matrix
}
