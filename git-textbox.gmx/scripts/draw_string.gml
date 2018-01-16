/// draw_string(x, y, text, [sep, w, max]);
//all args: x, y, text, sep, w, max
//args
var _x = argument[0];
var _y = argument[1];
var _text = argument[2];

//function modes
var mode_ext = argument_count>3;
var mode_type = argument_count>5;

//extra arguments
var _sep = -1;
var _w = room_width*1000;
var _max = string_length(_text);

if (mode_ext){
    var _sep = argument[3];
    var _w = argument[4];
}
if (mode_type){
    var _max = argument[5];
}

//max -1
if (_max == -1){
    _max = string_length(_text);
}

//separation set
if (_sep==-1){
    _sep = string_height(string_copy(_text, 1, 1)) * 1.2;
}

//draw
var _total_w = 0;
var _total_h = 0;

for(var i=0; i<min(_max, string_length(_text)); i++){
    //vars
    var _word = string_copy(_text, i+1, 1);
        
    //get next word
    var _word_next = string_copy(_text, i+2, 1);
    
    //next line
    var nextLine = false;
    //var _n = _word=="\" && _word_next=="n";
    if (_word=="#"){
        nextLine = true;
        //i+=_n;
    }
    
    //draw
    if (!nextLine){
        draw_text(_x + _total_w, _y + _total_h, _word);
    }
    
    //add to drawn width
    var _word_w = string_width(_word);
    
    _total_w += _word_w;
    
    //check if next word exceeds w
    if (_word==" "){
        //vars
        var _word_len = 0;
        
        var _full_word = _word_next;
        
        //loop to get word length
        while(_word_next!=" " && i+_word_len<string_length(_text)){
            _word_len++;
            _word_next = string_copy(_text, i+2+_word_len, 1);
            _full_word += _word_next;
        }
        
        //check if word exceeds
        var _ext_len = _total_w + string_width(_full_word);
        if (_ext_len > _w){
            _total_w = _w + 1;
        }
    }
    
    //add to drawn height
    if (_total_w > _w || nextLine){
        _total_w = 0;
        _total_h += _sep;
    }
}
