kbd = Keyboard.new

lc1, lc2, lc3 = 0, 1, 2 # Left board column pins
rc1, rc2, rc3 = 29, 28, 27 # Right board column pins
r1, r2, r3, r4 = 6, 5, 4, 3 # Row pins

# Matrix is a duplex that acts as one board with ethernet cable doing transport instead of SPI/UART over TRRS cable
# Don't change this pin assignment unless you really know what you're doing
kbd.split = false
kbd.init_matrix_pins(
  [
    #                          Main keys: columns alternate between col->row and row->column directions
    # Left board: columns right->left, rows top->bottom                 Right board: columns left->right, rows bottom->top
    [[lc3, r1], [r1, lc2],   [lc2, r1],  [r1, lc1],  [lc1, r1],         [rc1, r3],   [r3, rc1], [rc2, r3],  [r3, rc2],  [rc3, r3]],
    [[lc3, r2], [r2, lc2],   [lc2, r2],  [r2, lc1],  [lc1, r2],         [rc1, r2],   [r2, rc1], [rc2, r2],  [r2, rc2],  [rc3, r2]],
    [[lc3, r3], [r3, lc2],   [lc2, r3],  [r3, lc1],  [lc1, r3],         [rc1, r1],   [r1, rc1], [rc2, r1],  [r1, rc2],  [rc3, r1]],
    #                              Thumb keys: rowX->col3 on both sides, opposite row directions
                            [[r3, lc3],  [r2, lc3],  [r1, lc3],         [r3, rc3],   [r2, rc3], [r1, rc3]], 
  ]
)

# Layers and hold-keys implement Peter Jang's 36-key beginner-friendly keyboard layout
# https://keymapdb.com/keymaps/peterxjang/
# https://peterxjang.com/blog/designing-a-36-key-custom-keyboard-layout.html
#
# Modify to your heart's content
kbd.add_layer :default, %i(
     KC_Q        KC_W        KC_E        KC_R        KC_T               KC_Y         KC_U       KC_I        KC_O        KC_P
     KC_A        KC_S        KC_D        KC_F        KC_G               KC_H         KC_J       KC_K        KC_L        KC_QUOTE
     L_SHIFT     KC_X        KC_C        KC_V        KC_B               KC_N         KC_M       KC_COMM     KC_DOT      R_SHIFT
                             L_TH_I      L_TH_C      L_TH_O             R_TH_O       R_TH_C     R_TH_I
)

kbd.add_layer :layer_1, %i(
     KC_1        KC_2        KC_3        KC_4        KC_5               KC_6         KC_7       KC_8        KC_9        KC_0
     KC_GRAVE    KC_NO       KC_NO       KC_NO       KC_NO              KC_LEFT      KC_DOWN    KC_UP       KC_RIGHT    KC_SCOLON
     L_SHIFT_1   KC_NO       KC_NO       KC_NO       KC_NO              KC_MINUS     KC_EQUAL   KC_LBRC     KC_RBRC     R_SHIFT_1
                             L_TH_I      L_TH_C      L_TH_O             R_TH_O       R_TH_C     R_TH_I
)

kbd.add_layer :layer_2, %i(
     KC_F1       KC_F2       KC_F3       KC_F4       KC_F5              KC_F6        KC_F7      KC_F8       KC_F9       KC_F10
     KC_11       KC_12       KC_NO       KC_NO       KC_NO              KC_NO        KC_NO      KC_NO       KC_NO       KC_NO
     KC_NO       KC_NO       KC_NO       KC_NO       KC_NO              KC_NO        KC_NO      KC_NO       KC_NO       KC_NO
                             L_TH_I      L_TH_C      L_TH_O             R_TH_O       R_TH_C     R_TH_I
)

# Hold keys
hold_delay, re_push_threshold = 200, 200

## Thumb keys with hold modifiers/layers
## O = Outer, C = Centre, I = Inner
kbd.define_mode_key :L_TH_O, [:KC_TAB, :KC_LCTL, hold_delay, re_push_threshold]
kbd.define_mode_key :L_TH_C, [:KC_LGUI, :KC_LGUI, hold_delay, re_push_threshold]
kbd.define_mode_key :L_TH_I, [:KC_ESC, :KC_LALT, hold_delay, re_push_threshold]

kbd.define_mode_key :R_TH_O, [:KC_ENT, :KC_ENT, hold_delay, re_push_threshold]
kbd.define_mode_key :R_TH_C, [:KC_SPC, :layer_1, hold_delay, re_push_threshold]
kbd.define_mode_key :R_TH_I, [:KC_BSPC, :layer_2, hold_delay, re_push_threshold]

## Pinky finger shifts
kbd.define_mode_key :L_SHIFT, [:KC_Z, :KC_LSFT, hold_delay, re_push_threshold]
kbd.define_mode_key :L_SHIFT_1, [:KC_LSFT, :KC_LSFT, hold_delay, re_push_threshold]
kbd.define_mode_key :R_SHIFT, [:KC_SLASH, :KC_RSFT, hold_delay, re_push_threshold]
kbd.define_mode_key :R_SHIFT_1, [:KC_BSLASH, :KC_RSFT, hold_delay, re_push_threshold]

kbd.start!
