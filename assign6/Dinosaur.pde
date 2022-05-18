class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class
    	final float TRIGGERED_SPEED_MULTIPLIER = 5;
      float speed = 1f;  
      int direction;  
    Dinosaur(float x, float y){
      super(x, y);
    }
    
    void display(){
  
      pushMatrix();
      translate(x, y);
      if (direction == RIGHT) {
        scale(1, 1);
        image(dinosaur, 0, 0, w, h); 
        } else {
          scale(-1, 1);
          image(dinosaur, -w, 0, w, h); 
      }
      popMatrix(); 
      }

    void update(){
      if(player.y == this.y){
        if(direction == RIGHT && player.x > this.x ){
        x +=  TRIGGERED_SPEED_MULTIPLIER;
        }else if(direction == LEFT && player.x < this.x){
        x -=  TRIGGERED_SPEED_MULTIPLIER;
        }
        else{
          x += speed;
        }
      }
      else{
      x += speed;
      }
      
      if( x >= width-80 || x<=0) speed*=-1;
      direction = (speed > 0) ? RIGHT : LEFT;   // if speed >0 is right or is left
            
    }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
