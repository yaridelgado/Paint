class Layout {

  int blankAreaX, blankAreaY, blankAreaWidth, blankAreaHeight;
  int toolBtnSize;
  Button[] tools;
  ColorButton[] colors;
  ColorButton actualColor;
  color backgroundColor; // blank area background color

  Layout() {
    blankAreaX = 122;
    blankAreaY = 62;
    blankAreaWidth  = 480;
    blankAreaHeight = 337;

    toolBtnSize = 45;

    tools = new Button[6];
    colors = new ColorButton[20];

    drawLayout();
  }

  void drawLayout() {
    drawToolBar();

    // top bar
    fill(200);
    strokeWeight(2);
    rect(0, 0, 599, 60);

    drawColorBar();

    drawBlankArea(color(255));
  }

  void drawBlankArea(color background) {
    noStroke();
    backgroundColor = background;
    fill(backgroundColor);
    rect(blankAreaX, blankAreaY, blankAreaWidth, blankAreaHeight);
  }

  void drawToolBar() {
    strokeWeight(2);
    fill(200);

    // left tool bar
    rect(0, 0, 120, 500); 

    stroke(0);
    strokeWeight(1);

    createToolButtons();
    createToolIcons();
  }

  void createToolButtons() {
    // initial tool buttons position
    int posX = 15, posY = 80;

    // pen
    tools[0] = new Button(posX, posY, toolBtnSize, toolBtnSize) {
      // implements tool function
      @ Override public void action() {
        strokeWeight(penSize);
        strokeCap(ROUND);
        if (mousePressed && isInsideBlankArea(mouseX, mouseY)) {
          line(pmouseX, pmouseY, mouseX, mouseY);
        }
        //println("PEN");
      }
    };

    // spray
    tools[1] = new Button(posX + toolBtnSize, posY, toolBtnSize, toolBtnSize) {
      // implements tool function
      @ Override public void action() {
        strokeWeight(1);
        ellipseMode(RADIUS);
        if (mousePressed && isInsideBlankArea(mouseX, mouseY)) {
          ellipse(mouseX, mouseY, brushR, brushR);
        }
        //println("SPRAY");
      }
    };

    // eraser
    tools[2] = new Button(posX, posY + toolBtnSize, toolBtnSize, toolBtnSize) {
      // implements tool function
      @ Override public void action() {
        strokeWeight(eraserSize);
        strokeCap(SQUARE);
        stroke(backgroundColor);
        if (mousePressed && isInsideBlankArea(mouseX, mouseY)) {
          line(pmouseX, pmouseY, mouseX, mouseY);
        }
        //println("ERASER");
      }
    };

    // paint bucket
    tools[3] = new Button(posX + toolBtnSize, posY + toolBtnSize, toolBtnSize, toolBtnSize) {
      // implements tool function
      @ Override public void action() {
        drawBlankArea(actualColor.btnColor);
        //println("PAINT BUCKET");
      }
    };

    // decrease
    tools[4] = new Button(posX, posY + 2*toolBtnSize, toolBtnSize, toolBtnSize) {
      // implements tool function
      @ Override public void action() {
        if (penSize > 1 && eraserSize > 2 && brushR > 1) {
          penSize--;
          eraserSize--;
          brushR--;
        }
        //println("DECREASE");
      }
    };

    // increase
    tools[5] = new Button(posX + toolBtnSize, posY + 2*toolBtnSize, toolBtnSize, toolBtnSize) {
      // implements tool function
      @ Override public void action() {
        penSize++;
        eraserSize++;
        brushR++;
        //println("INCREASE");
      }
    };

    // draws buttons
    for (int i = 0; i < tools.length; i++) {
      tools[i].display();
    }
  }
  
  void createToolIcons() {
    //  15, 80, 45 - pen
    stroke(0);
    strokeWeight(2);
    line(25, 115, 50, 90);
    
    //  60, 80, 45 - spray
    noStroke();
    fill(0);
    ellipse(75, 110, 10, 10);
    ellipse(90, 95, 10, 10);
    
    // 15, 125, 45 - eraser
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(30, 140, 15, 15);
    
    // 60, 125, 45 - paint bucket
    noFill();
    quad(95, 145, 85, 160, 70, 155, 80, 140);
    fill(0);
    triangle(91, 147, 84, 157, 74, 154);
    
    // 15, 170, 45 - increase
    stroke(0);
    strokeWeight(3);
    strokeCap(SQUARE);
    line(30, 192, 45, 192);
    
    // 60, 170, 45 - decrease
    line(75, 192, 90, 192);
    line(82, 185, 82, 200);
  }

  void drawColorBar() {
    strokeWeight(2);
    fill(200);

    // bottom bar
    rect(0, 400, 599, 99);

    strokeWeight(1);
    // colors bar
    rect(85, 415, 350, 70); 

    int[][] colorsRGB = new int[2][10];
    int colorSize = 35;

    // first line
    colorsRGB[0][0] = color(0, 0, 0);
    colorsRGB[0][1] = color(70, 20, 20);
    colorsRGB[0][2] = color(140, 200, 40);
    colorsRGB[0][3] = color(50, 75, 200);
    colorsRGB[0][4] = color(110, 50, 200);
    colorsRGB[0][5] = color(160, 50, 70);
    colorsRGB[0][6] = color(140, 20, 20);
    colorsRGB[0][7] = color(247, 124, 0);
    colorsRGB[0][8] = color(250, 235, 66);
    colorsRGB[0][9] = color(200, 200, 200);

    // second line
    colorsRGB[1][0] = color(80, 80, 110);
    colorsRGB[1][1] = color(150, 80, 60);
    colorsRGB[1][2] = color(120, 230, 90);
    colorsRGB[1][3] = color(10, 200, 230);
    colorsRGB[1][4] = color(20, 230, 200);
    colorsRGB[1][5] = color(240, 130, 140);
    colorsRGB[1][6] = color(220, 50, 50);
    colorsRGB[1][7] = color(255, 183, 111);
    colorsRGB[1][8] = color(255, 248, 165);
    colorsRGB[1][9] = color(255, 255, 255);

    // creates and draws buttons
    int c = 0;
    for (int i = 0, y = 415; i < 2; i++, y += colorSize) {
      for (int j = 0, x = 85; j < 10; j++, x+= colorSize) {
        colors[c] = new ColorButton(x, y, colorSize, colorSize, colorsRGB[i][j]);
        colors[c].display();
        c++;
      }
    }

    actualColor(colors[0].btnColor);
  }

  // draw actual color square
  void actualColor(color actual) {
    strokeWeight(2);
    stroke(actual);
    actualColor = new ColorButton(15, 415, 70, 70, actual);
    actualColor.display();
  }

  boolean isInsideBlankArea(int posXMouse, int posYMouse) {
    boolean isInside = false;

    // different aproaches due to tool shapes and sizes
    // pen
    if (tools[0].isActive) {
      isInside = posXMouse - penSize > blankAreaX && posXMouse + penSize < blankAreaX + blankAreaWidth
              && posYMouse - penSize > blankAreaY && posYMouse + penSize < blankAreaY + blankAreaHeight;
    // spray
    } else if (tools[1].isActive) {
      isInside = posXMouse - brushR > blankAreaX && posXMouse + brushR < blankAreaX + blankAreaWidth
              && posYMouse - brushR > blankAreaY && posYMouse + brushR < blankAreaY + blankAreaHeight;
    // eraser
    } else if (tools[2].isActive) {
      isInside = posXMouse - eraserSize > blankAreaX && posXMouse + eraserSize < blankAreaX + blankAreaWidth
              && posYMouse - eraserSize > blankAreaY && posYMouse + eraserSize < blankAreaY + blankAreaHeight;
    }

    return isInside;
  }

  void activate(Button btn) {
    // half of the tools, including only pen, spray and eraser
    boolean isPaintTool = false; 
    for (int i = 0; i < 3; i++) {
      if (tools[i] == btn) {
        isPaintTool = true;
      }
    }
    
    // activate the selected paint tool and deactivate the others
    if (isPaintTool) {
      for (int i = 0; i < 3; i++) {
        if (tools[i] == btn) {
          tools[i].setActive(true);
        } else {
          tools[i].setActive(false);
        }
      }
    }
  }
}
