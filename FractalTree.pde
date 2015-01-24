private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5; 
yungMoney [] money; 
public void setup() 
{   
  size(640,580);    
  money = new yungMoney[200];
    for (int i = 0; i < money.length; i++){
      money[i] = new yungMoney();
    }  
} 
public void draw() 
{  branchAngle= branchAngle+.01;
if(fractionLength==.3)
{color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));}
  background(0);  
  for (int i = 0; i < money.length; i++){
    money[i].show();
      money[i].move();
      money[i].wrap();
    } 
  stroke(255,255,255);
  strokeWeight(20);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2,3);  


} 
public void drawBranches(int x,int y, double branchLength, double angle, double strWeight) 
{   
  double angle1, angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  branchLength = branchLength*fractionLength;
  strokeWeight((float)strWeight);
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);   
  line(x, y, endX2, endY2);

  if (branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1, strWeight/1.2);
    drawBranches(endX2, endY2, branchLength, angle2, strWeight/1.2);
  }
} 

class yungMoney
{
  //class member variable declarations
  int myX;
  int myY;
  boolean isMoving;
  yungMoney()
  {
    //class member variable initializations
    myX = (int)(Math.random()*1200);
    myY = (int)(Math.random()*600);
    isMoving = true;
  }
  void show()
  {
    //your code here
    noStroke();
    fill(0,(int)(Math.random()*255),0);
    textSize(32);
    text("$",myX,myY);
    textSize(15);
    text("fractal",myX+30,myY+30);
  }

  void move()
  {
    //your code here
    if (isMoving == true){
      myY = myY + 1;
    } 
  }
  void wrap()
  {
    //your code here
    if (myY > 585){
      myY = 0;
      myX = (int)(Math.random()*1200);      
    }
  }
}
