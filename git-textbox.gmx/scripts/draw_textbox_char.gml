/// draw_textbox_char(string, x, y, characters, [speaker]);
/// Specify -1 in characters to display full string
//Optional arg
var _speaker = undefined;

if (argument_count > 4){
    _speaker = argument[4];
}

//Main
return draw_textbox(argument[0], argument[1], argument[2], argument[3], _speaker);
