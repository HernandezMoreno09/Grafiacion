PImage img;

void setup() {
  size(1421  , 800); // Tamaño de la ventana
  img = loadImage("imagen.jpg"); // Cargar la imagen del directorio "data"

  if (img == null) {
    println("Error: No se pudo cargar la imagen.");
    exit();
  }

  background(0); // Fondo negro
  displayImageCentered(img);
}

void displayImageCentered(PImage im) {
  // Calcular la relación de aspecto de la imagen y la ventana
  float imgAspect = float(im.width) / im.height;
  float winAspect = float(width) / height;

  float scaleFactor;

  if (imgAspect > winAspect) {
    // Imagen más ancha que la ventana, ajustamos al ancho de la ventana
    scaleFactor = float(width) / im.width;
  } else {
    // Imagen más alta que la ventana, ajustamos al alto de la ventana
    scaleFactor = float(height) / im.height;
  }

  // Aplicar la transformación modelo/vista
  pushMatrix();
  translate(width / 2, height / 2); // Centrar el origen en el medio de la ventana
  scale(scaleFactor); // Escalar proporcionalmente
  imageMode(CENTER); // Dibujar la imagen desde su centro
  image(im, 0, 0); // Dibujar la imagen centrada
  popMatrix();
}
