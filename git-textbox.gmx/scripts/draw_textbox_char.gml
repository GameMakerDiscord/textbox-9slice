/// draw_textbox_char(x, y, string, characters, [speaker]);

//Optional arg
var _speaker = undefined;

if (argument_count > 4){
    _speaker = argument[4];
}

//Main
return draw_textbox(argument[0], argument[1], argument[2], argument[3], _speaker);
