class Soldier extends Enemy{
	

  Soldier(float x, float y){
      super(x, y);
    }

	void display(){
		image(soldier, x, y);
	}

	void update(){
		x += speed;
		if(x >= width) x = -w;
	}

	
}
