/// draw_textbox_char(string, characters, [x, y, speaker]);
/// Specify -1 in characters to display full string
//Optional args
var _x = undefined;
var _y = undefined;
var _speaker = undefined;

if (argument_count > 2){
    _x = argument[2];
}
if (argument_count > 3){
    _y = argument[3];
}
if (argument_count > 4){
    _speaker = argument[4];
}

//Main
return draw_textbox(argument[0], _x, _y, argument[1], _speaker);
