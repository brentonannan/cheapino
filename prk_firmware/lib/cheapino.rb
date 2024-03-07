class Cheapino < Keyboard
  LC1, LC2, LC3 = 0, 1, 2 # Left board column pins
  RC1, RC2, RC3 = 29, 28, 27 # Right board column pins
  R1, R2, R3, R4 = 6, 5, 4, 3 # Row pins

  MATRIX = [
    #                          Main keys: columns alternate between col->row and row->column directions
    # Left board: columns right->left, rows top->bottom                 Right board: columns left->right, rows bottom->top
    [[LC3, R1], [R1, LC2],   [LC2, R1],  [R1, LC1],  [LC1, R1],         [RC1, R3],   [R3, RC1], [RC2, R3],  [R3, RC2],  [RC3, R3]],
    [[LC3, R2], [R2, LC2],   [LC2, R2],  [R2, LC1],  [LC1, R2],         [RC1, R2],   [R2, RC1], [RC2, R2],  [R2, RC2],  [RC3, R2]],
    [[LC3, R3], [R3, LC2],   [LC2, R3],  [R3, LC1],  [LC1, R3],         [RC1, R1],   [R1, RC1], [RC2, R1],  [R1, RC2],  [RC3, R1]],
    #                              Thumb keys: rowX->col3 on both sides, opposite row directions
                            [[R3, LC3],  [R2, LC3],  [R1, LC3],         [R3, RC3],   [R2, RC3], [R1, RC3]],
  ]

  def initialize
    super
    # Matrix is a duplex that acts as one board with ethernet cable doing transport instead of SPI/UART over TRRS cable
    self.split = false
    self.init_matrix_pins(MATRIX)
  end
end
