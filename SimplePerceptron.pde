Perceptron brain;
Point[] points = new Point[100];
int trainingIndex = 0;

void setup(){
  // Make a canvas
  size(800, 800);
  // Instantiate a perceptron
  brain = new Perceptron(3);
  
  // Instantiate points
  for(int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
}

void draw(){
  // Color background
  background(255);
  // line through the middle
  stroke(0);
  //line(0, height, width, 0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.PixelX(), p1.PixelY(), p2.PixelX(), p2.PixelY());
  
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line(p3.PixelX(), p3.PixelY(), p4.PixelX(), p4.PixelY());
  
  // Draw points
  for(Point pt : points){
    pt.show();
  }
  
  
  for(Point pt : points){
    // Store points into an array
    float[] inputs = {pt.x, pt.y, pt.bias};
    // Store label
    int target = pt.label;
    // Guess whether above or below line
    int guess = brain.guess(inputs);
    // Display whether guess is right
    // Correct
    if(guess == target){
      fill(0, 255, 0);
    }
    // Incorrect
    else{
      fill(255, 0, 0);
    }
    // Draw circle indicating guess correctness
    noStroke();
    ellipse(pt.PixelX(), pt.PixelY(), 16, 16);
  }
  
  // Train a single point
  // Get a point from the next index in the array
  Point training = points[trainingIndex];
  // Store the points components into variables
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  // Train the point
  brain.train(inputs, target);
  // Increment training index for next interation
  trainingIndex++;
  // Reset index if at the end of the array
  if(trainingIndex == points.length){
    trainingIndex = 0;
  }
}
