PImage img;
int[] histograma = new int[256];

void setup() {
  size(800, 900); // Tamaño de la ventana, con espacio para el histograma
  img = loadImage("imagen.jpg"); // Cargar la imagen del directorio "data"

  background(0); // Fondo negro
  displayImageCentered(img);

  calculateHistogram(img);
  displayHistogram();
}

void displayImageCentered(PImage im) {
  float imgAspect = float(im.width) / im.height; // Relación de aspecto de la imagen
  float winAspect = float(width) / (height - 100); // Relación de aspecto de la ventana (excluyendo espacio para histograma)

  float displayWidth, displayHeight;

  if (imgAspect > winAspect) {
    // Imagen es más ancha que la ventana, ajustamos al ancho de la ventana
    displayWidth = width;
    displayHeight = width / imgAspect;
  } else {
    // Imagen es más alta que la ventana, ajustamos al alto de la ventana
    displayHeight = (height - 100);
    displayWidth = (height - 100) * imgAspect;
  }

  // Dibujar la imagen centrada
  float x = (width - displayWidth) / 2;
  float y = ((height - 100) - displayHeight) / 2;
  image(im, x, y, displayWidth, displayHeight);
}

void calculateHistogram(PImage im) {
  im.filter(GRAY); // Convertir la imagen a escala de grises

  // Inicializar el histograma
  for (int i = 0; i < histograma.length; i++) {
    histograma[i] = 0;
  }

  // Calcular el histograma
  for (int x = 0; x < im.width; x++) {
    for (int y = 0; y < im.height; y++) {
      int grayValue = int(red(im.get(x, y))); // Obtener el valor de gris
      histograma[grayValue]++;
    }
  }
}

void displayHistogram() {
  int maxVal = 0;
  for (int i = 0; i < histograma.length; i++) {
    if (histograma[i] > maxVal) {
      maxVal = histograma[i];
    }
  }

  stroke(255); // Color blanco para las líneas
  for (int i = 0; i < histograma.length; i++) {
    float barHeight = map(histograma[i], 0, maxVal, 0, 100); // Escalar las barras
    line(i, height - 1, i, height - 1 - barHeight); // Dibujar cada barra
  }
}
