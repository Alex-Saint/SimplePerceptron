// Activation Funtion
int sign(float n){
  if(n >= 0){
    return 1;
  }
  else{
    return -1;
  }
}


class Perceptron{
  float[] weights = new float[2];
    
  // Constructor
  Perceptron(){
    // Randomly initialize weights
    for(int i = 0; i < weights.length; i++){
      weights[i] = random(-1, 1);
    }
  }
  
  // Make a guess
  int guess(float[] inputs){
    float sum = 0;
    // Sum up the inputs
    for(int i = 0; i < weights.length; i++){
      sum += inputs[i]*weights[i];
    }
    // Pass them through the activation funtion
    int output = sign(sum);
    return output;
  }
  
  void train(float[] inputs, int target){
    int guess = guess(inputs);
    int error = target - guess;
    
    // Tune all the weights
    for(int i = 0; i < weights.length; i++){
      weights[i] += error * inputs[i];
    }
  }
}
