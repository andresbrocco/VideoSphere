import processing.video.*;

float rotX = 0;
float rotY = 0;
float transZ = 0;
Sphere sphere;

void setup() {
  size(600, 600, P3D);
  sphere = new Sphere(this, 0.5);
}

void draw() {
  background(0);
  setCamera();
  sphere.display();
}

void setCamera(){
  translate(width/2, height/2, transZ);
  rotateX(rotX);
  rotateY(rotY);
}

void mouseDragged() {
  if(mouseButton == LEFT){
    rotX = (rotX - (mouseY - pmouseY)*PI/height)%TWO_PI;
    rotY = (rotY + (mouseX - pmouseX)*PI/width)%TWO_PI;
  }
}

void mouseWheel(MouseEvent event) {
  if(event.getCount() < 0){
    transZ = transZ + 10;
  }else{
    transZ = transZ - 10;
  }
  println("transZ: "+transZ);
}
