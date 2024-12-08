PImage img;
PShape globo;
float ang;

void setup() {
  size(600, 600, P3D);
  img = loadImage("imagen.png");
  globo = createShape(SPHERE, 150);
  globo.setStroke(255);
  globo.scale(1.85, 1.09, 1.15); // Escala la esfera para convertirla en un elipsoide
  globo.setTexture(img);
  ang = 0;
}

void draw() {
  background(0);
  translate(width / 2, height / 2);

  // Configurar la iluminación
  pointLight(255, 255, 255, width / 2, height / 2, 200); // Una fuente de luz puntual
  ambientLight(100, 100, 100); // Iluminación ambiental suave

  rotateY(radians(ang)); // Rotación del elipsoide
  shape(globo);
  
  ang = ang + 1;
  if (ang > 360) ang = 0;
}
