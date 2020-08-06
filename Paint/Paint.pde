/**
 * Cinema de Animação e Artes Digitais - 2018.1
 * Estudo de Casos I - Processing
 *
 * Trabalho Prático Final
 * Alunas: Luísa Martins e Yari Delgado
 * Turma B
 */

int penSize, eraserSize, brushR;
Layout paintScreen;
Button activeButton;

void setup() {
  size(600, 500);
  background(255);

  penSize = 1;
  eraserSize = 2;
  brushR = 1;

  paintScreen = new Layout();
  // sets black as default color and pen as default tool
  paintScreen.colors[0].action();
  activeButton = paintScreen.tools[0];
  paintScreen.activate(paintScreen.tools[0]);  
}

void draw() {
  // sets active button
  for (int i = 0; i < paintScreen.tools.length; i++) {
    if (paintScreen.tools[i].isActive) {
      activeButton = paintScreen.tools[i];
    }
  }
  
  activeButton.action();
}

void mouseClicked() {
  // checks tool bar and execute button action
  for (int i = 0; i < paintScreen.tools.length; i++) {
    if (paintScreen.tools[i].isMouseInside(mouseX, mouseY)) { 
      paintScreen.activate(paintScreen.tools[i]);
      paintScreen.tools[i].action();
    }
  }

  // checks color bar and redefines actual color
  for (int i = 0; i < paintScreen.colors.length; i++) {
    if (paintScreen.colors[i].isMouseInside(mouseX, mouseY)) { 
      paintScreen.colors[i].action();
      paintScreen.actualColor(paintScreen.colors[i].btnColor);
    }
  }
}
