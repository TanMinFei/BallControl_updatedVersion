import controlP5.*;
ControlP5 cp5;
Slider slider;
ColorPicker cp;

int myColor = color(51);
int c1,c2;
float n,n1;   
int dragX, dragY,moveX,moveY;
float x;
float y;
float easing = 0.15;
boolean toggleValue = false;


void setup() {
    size(800,800);
    cp5 = new ControlP5(this);
    slider = cp5.addSlider("Set Size");
    slider.setPosition(20,20).setSize(200,20).setMax(800).moveTo("Change Size");
    cp = cp5.addColorPicker("picker").setPosition(60, 100).setColorValue(color(255, 128, 0, 128)).moveTo("Color");
    cp5.addButton("colorC").setPosition(200,200).setSize(200,200).moveTo("Change Background");
    cp5.addToggle("toggleValue").setPosition(40,100).setSize(50,20).moveTo("Change Shape");
    }

void draw() {
  background(myColor);
  myColor = lerpColor(c1,c2,n);
  n += (1-n)* 0.1;
  
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;
        
    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;
       
     if(toggleValue==true){
       
     ellipse(x,y,slider.getValue(),slider.getValue());
     fill(cp.getColorValue());
     }
     
     else {
       
     rect(x,y,slider.getValue(),slider.getValue());
     fill(cp.getColorValue());  
    }
}
public void controlEvent(ControlEvent theEvent) {
  n = 0;
}
// function colorC will receive changes from 
// controller with name colorC
public void colorC(int theValue) {
  c1 = c2;
  c2 = color(random(255),random(255),random(128));
}
public void play(int theValue) {
  redraw();
}