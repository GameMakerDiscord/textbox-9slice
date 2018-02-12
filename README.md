# 9slice Textbox Scripts

This project has scripts for drawing a textbox with some text.

![Example](https://i.imgur.com/tUIsbuY.gif)

Maintained by: gurpreetsinghmatharoo

# Usage

**They are to be used in the Draw GUI event.**

# Example

This project comes with a basic example for testing the scripts. Run the game and hold SPACE for the text to appear.

# Functions

Here are the main functions in this project:

## Textbox Functions

### draw_textbox(text, [x, y])

Draws a textbox on the screen.

The [x, y] arguments are optional. If you don't fill in those arguments (or just fill `undefined`), the textbox will automatically adjust its location at the bottom of the window.

#### Example

```js
draw_textbox("GitHub is cool!");

draw_textbox("and GameMaker too!", 0, 50);
```

### draw_textbox_char(text, characters, [x, y, speaker])

Draws a textbox with a specified number of characters.

Use this function for a typing effect. The second argument specifies how many characters are drawn from the text.

The three arguments [x, y, speaker] are optional. [x, y] can take `undefined` - it will be the same as not filling those arguments.

[speaker] is the ID of the speaker to use, and it's optional. Read more under the [**Speakers**](https://github.com/GameMakerDiscord/textbox-9slice/blob/master/README.md#speaker-functions) section.

#### Example
```js
draw_textbox_char("Hello!", 4); //Will say "Hell"

draw_textbox_char("I'm saying this in a typing effect...", chars);
```

## Textbox Options

These are options that you can modify before drawing a textbox - usage is similar to using `draw_set_color()` to change the color before drawing something in GML.

### tb_set_size(width, height)

By default, a textbox will automatically adjust its size according the GUI layer's size. Using this function, you can change the size to use in textbox functions that come after this.

Use `tb_reset_size()` after you're done drawing a differently-sized textbox.

```js
draw_textbox("This is a full size textbox");

tb_set_size(64, 64);
draw_textbox("This textbox is smol");
tb_reset_size();
```

### tb_set_sprite(sprite, subimg)

Changes the sprite used for the textboxes drawn after this function. By default, the scripts will use `sTextbox` which comes with this project. Use `tb_reset_sprite` to set the sprite to the default one.

The sprite must be square, can be any size. Must be a 3x3 grid.

```js
tb_set_sprite(sNewTextbox, 1);
draw_textbox("Whoa, a new textbox!");
tb_reset_sprite();
```

## Speaker Functions

Speakers are the people who will say the text in the textbox. They're not required, but in the `draw_textbox_char()` function, you can specify a speaker.

A speaker needs an image and a name, and it will appear with the message.

### speaker_add(name, sprite, subimg)

This will create a new speaker with the specified name & image. Store the returned value in a variable.

```js
spkDan = speaker_add("Dan", sDan, 0);
```

### speaker_delete(id)

This will delete a speaker.

```js
speaker_delete(spkDan);
```

## Speaker Options

### speaker_stretch(bool)

Set whether or not to stretch the speakers' images to fit the textbox.

*Default: true*

### speaker_pic_out(bool)

Set whether or not to draw the speakers' images outside of the box. Note that stretching will not be applied if this is true.

*Default: false*

#### Example:

![Example](https://i.imgur.com/czrxeKA.png)

### speaker_pic_offset(x, y)

Set an offset for the speakers' images. The x and y values will be added to the position of the images when they're drawn.

*Default: 0, 0*
