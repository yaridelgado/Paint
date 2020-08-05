class ColorButton extends Button {

  ColorButton(int aPosX, int aPosY, int aBtnWidth, int aBtnHeight, color aBtnColor) {
    super(aPosX, aPosY, aBtnWidth, aBtnHeight, aBtnColor);
  }

  void action() {
    fill(btnColor);
    stroke(btnColor);
  }

}
