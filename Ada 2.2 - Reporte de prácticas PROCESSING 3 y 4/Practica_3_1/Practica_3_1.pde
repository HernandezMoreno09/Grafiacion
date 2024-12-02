PImage img;

void setup() {
  size(800, 800); // Tamaño de la ventana
  img = loadImage("imagen.jpg"); // Cargar la imagen del directorio "data"

  background(0); // Fondo negro
  displayImageCentered(img);
}

void displayImageCentered(PImage im) {
  float imgAspect = float(im.width) / im.height; // Relación de aspecto de la imagen
  float winAspect = float(width) / height;      // Relación de aspecto de la ventana

  float displayWidth, displayHeight;

  if (imgAspect > winAspect) {
    // Imagen es más ancha que la ventana, ajustamos al ancho de la ventana
    displayWidth = width;
    displayHeight = width / imgAspect;
  } else {
    // Imagen es más alta que la ventana, ajustamos al alto de la ventana
    displayHeight = height;
    displayWidth = height * imgAspect;
  }

  // Dibujar la imagen centrada
  float x = (width - displayWidth) / 2;
  float y = (height - displayHeight) / 2;
  image(im, x, y, displayWidth, displayHeight);
}
