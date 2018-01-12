# 9slice Textbox Scripts

This package has scripts for drawing a textbox with some text.

# Usage

**They are to be used in the Draw GUI event.**

# Functions

Here are the main functions in this package:

## Textbox Functions

### draw_textbox(text, [x, y])

Draws a textbox on the screen.

The [x, y] arguments are optional. If you don't fill in those arguments (or just fill `undefined`), the textbox will automatically adjust its location at the bottom of the window.

#### Example

```
draw_textbox("GitHub is cool!");

draw_textbox("and GameMaker too!", 0, 50);
```

### draw_textbox_char(text, characters, [x, y, speaker])

Draws a textbox with a specified number of characters.

Use this function for a typing effect. The second argument specifies how many characters are drawn from the text.

The three arguments [x, y, speaker] are optional. [x, y] can take `undefined` - it will be the same as not filling those arguments.

[speaker] is the ID of the speaker to use, and it's optional. Read more under the **Speakers** section.

#### Example
```
draw_textbox_char("Hello!", 4); //Will say "Hell"

draw_textbox_char("I'm saying this in a typing effect...", chars);
```

## Speaker Functions

Speakers are the people who will say the text in the textbox. They're not required, but in the `draw_textbox_char()` function, you can specify a speaker.

A speaker needs an image and a name, and it will appear with the message.

### speaker_add(name, sprite, subimg)

This will create a new speaker with the specified name & image. Store the returned value in a variable.


