import processing.video.*;

Sphere sphere;

void setup() {
  size(600, 600, P3D);
  sphere = new Sphere(this, 0.5);
}

void draw() {
  sphere.display();
}


void mouseDragged() {
  if(mouseButton == LEFT){
    sphere.cameraRotX = (sphere.cameraRotX - (mouseY - pmouseY)*PI/height)%TWO_PI;
    sphere.cameraRotY = (sphere.cameraRotY + (mouseX - pmouseX)*PI/width)%TWO_PI;
  }
}

void mouseWheel(MouseEvent event) {
  if(event.getCount() < 0){
    sphere.cameraTransZ = sphere.cameraTransZ + 10;
  }else{
    sphere.cameraTransZ = sphere.cameraTransZ - 10;
  }
  println("cameraTransZ: "+sphere.cameraTransZ);
}
