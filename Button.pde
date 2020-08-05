abstract class Button {

  int posX, posY;
  int btnWidth, btnHeight;
  color btnColor;
  boolean isActive;

  Button(int aPosX, int aPosY, int aBtnWidth, int aBtnHeight) {
    // passing default color
    this(aPosX, aPosY, aBtnWidth, aBtnHeight, color(240, 130, 140));
  }

  Button(int aPosX, int aPosY, int aBtnWidth, int aBtnHeight, color aBtnColor) {
    posX = aPosX;
    posY = aPosY;
    btnWidth  = aBtnWidth;
    btnHeight = aBtnHeight;
    btnColor  = aBtnColor;
    isActive  = false;
  }

  // draws button
  void display() {
    fill(btnColor);
    rect(posX, posY, btnWidth, btnHeight);
  }

  boolean isMouseInside(int posXMouse, int posYMouse) {
    return (posXMouse > posX && posXMouse < posX + btnWidth) &&
           (posYMouse > posY && posYMouse < posY + btnHeight);
  }

  void setActive(boolean aIsActive) {
    isActive = aIsActive;
  }

  // to override
  abstract void action();

}
