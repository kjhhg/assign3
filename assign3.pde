final int GAME_START = 1;
final int GAME_RUN = 2;
int state = 1;
PImage bg1 ,bg2, hp, fighter, enemy, treasure, start1, start2;
int bgX;
int bgSpeedX ;
float hpW ;
float eX, eY;
int eSpeedX ;
int fX, fY ;
int fSpeedX, fSpeedY ;
int tX, tY ;
boolean upPressed = false ;
boolean downPressed = false ;
boolean leftPressed = false ;
boolean rightPressed = false ;

void setup(){
  size(640,480);
  bg1 = loadImage("assign3/img/bg1.png");
  bg2 = loadImage("assign3/img/bg2.png");
  hp = loadImage("assign3/img/hp.png");
  enemy = loadImage("assign3/img/enemy.png");
  fighter = loadImage("assign3/img/fighter.png");
  treasure = loadImage("assign3/img/treasure.png");
  start1 = loadImage("assign3/img/start1.png");
  start2 = loadImage("assign3/img/start2.png");
  
  //background
  bgX = 0 ;
    
  //fighter
  fX = width-50 ;
  fY = height/2-20 ;
  fSpeedX = 5 ;
  fSpeedY = 5 ;
  
  //enemy
  
  eY = floor(random(0+30,height-60));
  eSpeedX = floor(random(3,5)) ;
    
  //treasure
  tX = floor(random(0,width-50));
  tY = floor(random(0+30,height-50));
    
  //hp
  hpW = 200*(20.0/100.0);
  
}

void draw(){
  switch (state){
    //start
    case 1:
      image(start2,0,0);
      if(mouseY >= 380 && mouseY <= 420 && mouseX >=  200 && mouseX <=460){
        image(start1,0,0);
        if(mousePressed){
          state = 2;
        }
      }
      break;
           
    //gamerun
    case 2:
      //keypressed
      if (upPressed){
        fY -= fSpeedY;
      }
      if (downPressed){
        fY += fSpeedY;
      }
      if (rightPressed){
        fX += fSpeedX;
      }
      if (leftPressed){
        fX -= fSpeedX;
      }
          
      //fighter in screen
      if (fX > width-50){
        fX = width-50 ;
      }
      if (fX < 0 ){
        fX = 0;
      }
      if (fY > height-50){
        fY = height-50;
      }
      if (fY < 0){
        fY = 0;
      }
          
      //background
      image(bg1,bgX % 1280 -640,0);
      image(bg2,(bgX+640) % 1280 -640,0);
      bgX++;
      
      //hp
      noStroke();
      fill(255,0,0);
      rect(10,5,hpW,20);
      image(hp,0,0);
      
      //treasure
      image(treasure,tX,tY);
      
      //fighter
      image(fighter,fX,fY);          
          
      //enemy
      final int COUNT = -6;
      float spacingX = -70;
      float spacingY = 50;
      
      for(int i = -1;i > COUNT;i--){
        eX = i*spacingX;
        image(enemy,eX,eY);
      }
        
        //if(eX > width){
         // for
            
  }
}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
      upPressed = true;
      break;
      case DOWN:
      downPressed = true;
      break;
      case RIGHT:
      rightPressed = true;
      break;
      case LEFT:
      leftPressed = true;
      break;
    }
  }
}

void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
      upPressed = false;
      break;
      case DOWN:
      downPressed = false;
      break;
      case RIGHT:
      rightPressed = false;
      break;
      case LEFT:
      leftPressed = false;
      break;
    }
  }
}

