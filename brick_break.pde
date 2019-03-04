//https://www.openprocessing.org/sketch/134612/

import java.util.Random;
int t;
Ball ball;
Platform plat;
Blocks[] block = new Blocks[t];
float delay = .0001;
int rows = 3;
int col = 12;
void setup() {
  size(1000, 800);
  background(0);
  ball = new Ball(width/2, height/2, 25);
  plat = new Platform(width/2, height - 25);
  rectMode(CENTER);
  for (int i = 0; i<rows; i++) {
    for(int j = 0; j < col; j++){
  block[i*rows + j] = new Blocks((i+1) *width/(rows + 2), (j+1) * 50);
    }  
}
}


void draw() {
  background(0);
  ball.Move();
  ball.Display();
  plat.move();
  plat.display();
  //block.move();
  // block.Display();
}

void ball() {
  // Random rand = new Random();          // random num gen
  //x = rand.nextfloat(6.0);            // get number between 0 and 5
}
class Ball {
  int size;
  float hspeed= 4;
  float vspeed= 4;
  float x = width/2;
  float y = height /2;

  Ball(int tempX, int tempY, int tempSZ) {
    x = tempX;
    y = tempY;
    size = tempSZ;
  }
  void Move() {
    // y=y +5;
    if (ball.x < plat.x + 75 && ball.x > plat.x -75) {
      if (plat.y +10 - ball.y < ball.size) {
        ball.vspeed = -5;
      }
    } 
    // keyTyped();
    x = x + hspeed;
    y = y + vspeed;
    if (x> width) {
      hspeed = -4;
    }
    if (y>height) {
      vspeed = -5;

      // y  = sin(y)*40.0;
      //  vspeed =sin(x)*40.0;

      //  hspeed= hspeed*sin(y)*40.0;
    }
    if (x<0) {
      hspeed = 4;
    }
    if (y<0) {
      vspeed = 5;
    }
  }

  void keyTyped() {
    if (key == 'a') {
      hspeed = -4;
    }
    if (key == 'd') {
      hspeed = +4;
    }
    if (key == 'w') {
      vspeed = -2;
    }
    if (key == 's') {
      vspeed = +2;
    }
    if (key == 'l') {
      vspeed = 0;
    }
    if (key == 'o') {
      hspeed = 0;
    }
  }
  void Display() {
    ellipse(x, y, size, size);
  }
}

class Platform {
  float hspeed = 7;

  float x;
  float y;
  Platform(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  void move() {
    float Mx = mouseX;                    
    float dx = Mx - x;                     //gets x postion of mouse and moves to it refrenced
    x += dx + delay;

    //keyTyped();
    //x = x + hspeed;
  }


  void display() {
    rect(x, y, 150, 20);
  }
  void keyTyped() {
    if (key == 'a') {
      hspeed = -7;
    }
    if (key == 'd') {
      hspeed = +7;
    }
  }
}
void Blocks(){

}
class Blocks {

  int x =1;
  int y= 1;
  int size = 60;
  void move() {
    float Mx = mouseX;                    
    float dx = Mx - x;                     //gets x postion of mouse and moves to it refrenced
    x += dx + delay;
    //    if(ball.x < block.x + 60 && ball.x > block.x -60){
    //  if(block.y +30 - ball.y < ball.size){
    //      ball.vspeed = +5;
    //      ball.hspeed = -5;
    //  }

    //}
  }
  void Display() {
    translate(width/2, height/2);
    rect(x, y, size, size/2);
  }
}
