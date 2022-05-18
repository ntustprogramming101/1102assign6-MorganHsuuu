class Robot extends Enemy {
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  int direction; 
  int coolDown;
  boolean ejection = false;
  Laser laser;

  Robot(float x, float y){
        super(x, y);
        coolDown = LASER_COOLDOWN;
      }
      
      
   void display(){
     pushMatrix();
      translate(x, y);
      if (direction == RIGHT) {
        scale(1, 1);
        image(robot, 0, 0, w, h); 
        } else {
          scale(-1, 1);
          image(robot, -w, 0, w, h); 
      }
      popMatrix(); 
   
   }   
   void update(){
     if( x >= width-80 || x<=0) speed*=-1;
     direction = (speed > 0) ? RIGHT : LEFT;  
     if(abs(player.y- this.y)/80 <= PLAYER_DETECT_RANGE_ROW){
       if(ejection == false){
        firelaser(player);
        }       
        laser.display();
        laser.update();
        laser.checkCollision(player);
        
      if( coolDown == LASER_COOLDOWN ){
       ejection = true;        
      }
      coolDown--;
      if(coolDown == 0){
       coolDown = LASER_COOLDOWN;
       ejection = false; 
      }
     // println(coolDown);
     }  
     else {
     
     x += speed;
     }
    } 
    
    void firelaser(Player player){
    laser = new Laser();
    if( this.x<=player.x ){
      laser.fire(this.x + HAND_OFFSET_X_FORWARD, this.y + HAND_OFFSET_Y, player.x + player.w/2 , player.y + player.h/2);
    }else{  
      laser.fire(this.x + HAND_OFFSET_X_BACKWARD, this.y + HAND_OFFSET_Y, player.x + player.w/2 , player.y + player.h/2);
    }
    ejection = true;
  }  
     
      
    
   //void cooldown(){
   //  if(coolDown>0) coolDown--;
   //  if(coolDown==0) coolDown = LASER_COOLDOWN;
   //} 
	// HINT: Player Detection in update()
	/*
  
	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
