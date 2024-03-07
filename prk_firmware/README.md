# PRK Firmware on Cheapino

[PRK Firmware](https://github.com/picoruby/prk_firmware) is a firmware framework written and configured in [PicoRuby](https://github.com/picoruby/picoruby), an mruby implementation written to run on microcontrollers.

PRK is a great fit for the Cheapino because the RP2040 (which powers the Cheapino's [RP2040-zero MCU](https://www.waveshare.com/rp2040-zero.htm)) is the target architecture, and [it implements duplex matrix scanning](https://github.com/picoruby/prk_firmware/wiki/Keyscan-matrix#duplex-and-round-robin-matrix) natively.

## Installation

Installation is easy, mostly due to PRK's [excellent docs](https://github.com/picoruby/prk_firmware/wiki/)!

1. Follow PRK's [Tutorial](https://github.com/picoruby/prk_firmware/wiki/Tutorial) to flash the firmware.
2. Copy the contents of this directory to the mounted `PRK DRIVE`; it should have `keyboard.rb` and `lib/cheapino.rb` files in its root.
3. Enjoy [Peter Jang's 36-key beginner-friendly keyboard layout](https://keymapdb.com/keymaps/peterxjang/); check out the excellent write up of its design considerations [here](https://peterxjang.com/blog/designing-a-36-key-custom-keyboard-layout.html)!

## Configuration

Configuration of PRK Framework is done in Ruby:

- [`lib/cheapino.rb`](./lib/cheapino.rb) defines `Cheapino` as a subclass of `Keyboard` which configures pins and duplex scanning on initialization.
- [`keymap.rb`](./keymap.rb) adds [layers and mode keys](https://github.com/picoruby/prk_firmware/wiki/Layers-and-mode-key) to the initialized keyboard.
- PRK provides a [whole lot of constructs](https://github.com/picoruby/prk_firmware/wiki) for configuration.

Have fun!
