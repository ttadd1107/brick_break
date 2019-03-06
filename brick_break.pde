//https://www.openprocessing.org/sketch/134612/

import java.util.Random;
float delay = .0001;
int rows = 9;
int col = 9;            //global variables
int t = col * rows;
Ball ball;
Platform plat;               //creation of objects
Blocks[] block = new Blocks[t];  //array for blocks

void setup() {
  size(1000, 800);
  background(0);
  ball = new Ball(width/2, height/2 +100, 20);
  plat = new Platform(width/2, height - 25);
  rectMode(CENTER);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j< col; j++) {
      block[i*rows + j] = new Blocks((i+1) *width/(rows + 2), (j+1) * 50);  // places all blocks in an array
    }
  }
}


void draw() {
  background(0);
  for (int i = 0; i<t; i++)
  {
    block[i].Display();    // displays all blocks 
  }
  collision();       //check for colision
  ball.Move();
  ball.Display();
  plat.move();
  plat.display();
}

void ball() {
  // Random rand = new Random();          // random num gen
  //x = rand.nextfloat(6.0);            // get number between 0 and 5
}
class Ball {
  int size;
  int num = 5;
  float hspeed= num;
  float neghspeed = -num;
  float poshspeed = num;
  float vspeed= num;
  float negvspeed = -num;
  float posvspeed = num;
  float x = width/2;
  float y = height /2;

  Ball(int tempX, int tempY, int tempSZ) {
    x = tempX;
    y = tempY;
    size = tempSZ;
  }
  void Move() {
    // y=y +5;
    fill(255);                                  //makes sure ball is white
    //if (ball.x < plat.x + 75 && ball.x > plat.x -75) {            
    //  if (plat.y +10 - ball.y < ball.size) {
    //   // ball.vspeed = -5;
    //  }
    //} 

    x = x + hspeed;
    y = y + vspeed;
    if (x> width) {
      hspeed = -num;
    }
    if (y>height) {
      y = height/2;
      x = width/2;
      // y  = sin(y)*40.0;
      //  vspeed =sin(x)*40.0;

      //  hspeed= hspeed*sin(y)*40.0;
    }
    if (x<0) {
      hspeed = num;
    }
    if (y<0) {
      vspeed = num;
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
  int wide = 150;
  int high = 20;
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
    rect(x, y, wide, high);
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
void Blocks() {
}
class Blocks {

  float x =1;
  float y= 1;
  int size = 60;
  int colls = 255;               //declaration of numbers
  boolean hit;
  int high= 25;
  int wide = 50;

  Blocks(float tempX, float tempY)
  {
    x = tempX;
    y = tempY;
    colls = 255;              //makes a call for blocks
    hit = false;
  }


  void wasHit() {
    hit = true;
    colls = 0;
    rect(x, y, wide, high);
  }

  void Display() {
    fill(colls);
    // translate(width/2, height/2);
    rect(x, y, size, size/2);
  }
}
void collision() {
  //refrenced
  if (ball.y == plat.y && ball.x > plat.x && ball.x <= plat.x + (plat.wide / 2) ) {   ///collision for platform and ball
    ball.hspeed = ball.poshspeed;
    ball.vspeed =ball.vspeed *-1;
  }
  if (ball.y == plat.y && ball.x < plat.x && ball.x <= plat.x + (plat.wide / 2) ) {
    ball.hspeed = ball.neghspeed;
    ball.vspeed =ball.vspeed *-1;
  }
  for (int i = 0; i < t; i ++) {
    //if top of brick is hit by ball change direction          refrenced
    if (ball.y + ball.size / 2 >= block[i].y && ball.y - ball.size /2 <= block[i].y + block[i].high/2 && ball.x >= block[i].x && ball.x <= block[i].x + block[i].wide && block[i].hit == false ) {
      ball.vspeed =ball.vspeed *-1;
      block[i].wasHit();
    }
    //if bottom of block is hit by ball change direction
    if (ball.y - ball. size / 2 <= block[i].y + block[i].high &&  ball.y - ball.size/2 >= block[i].y && ball.x >= block[i].x && ball.x <= block[i].x + block[i].high  && block[i].hit == false ) {
      ball.vspeed = ball.vspeed*-1;
      block[i].wasHit();
    }
    //collision for right side of block                     refrenced
    if (ball.x - ball.size/2 +5<= block[i].x + block[i].wide && ball.x + ball.size / 2 >= block[i].x + block[i].wide / 2 && ball.y >= block[i].y && ball.y <= block[i].y + block[i].high  && block[i].hit == false) {
      ball.hspeed = ball.poshspeed;
      block[i].wasHit();
    }
    //collision of left side of block
    if (ball.x + ball.size / 2 +ball.size>= block[i].x && ball.x + ball.size / 2 <= block[i].x + block[i].wide / 2 && ball.y >= block[i].y && ball.y <= block[i].y + block[i].high  && block[i].hit == false) {
      ball.hspeed = ball.neghspeed;
      block[i].wasHit();
    }
  }
}
