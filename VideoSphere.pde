import processing.video.*;

float cameraRotX = 0;
float cameraRotY = 0;
float cameraTransZ = 0;
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
  translate(width/2, height/2, cameraTransZ);
  rotateX(cameraRotX);
  rotateY(cameraRotY);
}

void mouseDragged() {
  if(mouseButton == LEFT){
    cameraRotX = (cameraRotX - (mouseY - pmouseY)*PI/height)%TWO_PI;
    cameraRotY = (cameraRotY + (mouseX - pmouseX)*PI/width)%TWO_PI;
  }
}

void mouseWheel(MouseEvent event) {
  if(event.getCount() < 0){
    cameraTransZ = cameraTransZ + 10;
  }else{
    cameraTransZ = cameraTransZ - 10;
  }
  println("cameraTransZ: "+cameraTransZ);
}
