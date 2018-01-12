/// draw_textbox(string, [x, y]);
// ARGS: string, [x, y, characters, speaker, center, textbox_sprite, textbox_index, stretch_center]
// RETURNS: true only if the message is completely drawn/typed out

//Args
var _string = argument[0];

//Optional
var _x = undefined;
var _y = undefined;

//Optional args that are handled by separate scripts
var _char = -1; //How many characters to display, -1 for all
var _speaker = undefined; //Who is the speaker? (Using speaker_add())
var _center = false; //Whether to draw the textbox in the center
//var _w = undefined; //(Moved to global var) Width of the textbox, undefined for GUI width
//var _h = undefined; //(Moved to global var) Height of the textbox, undefined for GUI height
var _tb = sTextbox; //Textbox sprite
var _tbIn = 0; //Textbox image index
var _stretch = false; //Whether to stretch the parts of the textbox or tile them (if false)
var _tbHeight = 0.2; //Height perctange of the textbox

//Optional args if given
if (argument_count > 1) _x = argument[1];
if (argument_count > 2) _y = argument[2];
if (argument_count > 3) _char = argument[3];
if (argument_count > 4) _speaker = argument[4];
if (argument_count > 5) _center = argument[5];
//if (argument_count > 6) _w = argument[6];
//if (argument_count > 7) _h = argument[7];
if (argument_count > 6) _tb = argument[6];
if (argument_count > 7) _tbIn = argument[7];
if (argument_count > 8) _stretch = argument[8];
if (argument_count > 9) _tbHeight = argument[9];

//Text to display
var _text = ternary(_char >= 0, string_copy(_string, 1, _char), _string);

//Data
var guiH = display_get_gui_height();
var guiW = display_get_gui_width();

//Size
var _w = ternary(global.tbWidth == -1, guiW, global.tbWidth);
var _h = ternary(global.tbHeight == -1, guiH * _tbHeight, global.tbHeight);

//Position
_x = ternary(_x == undefined, 0, _x);
_y = ternary(_y == undefined, guiH - _h, _y);

//Size based on position
if (_x > 0){
    _w -= _x;
}

if (_y > guiH - _h){
    _h += (guiH - _h) - _y;
}

//Sprite sizes
var cellSize = sprite_get_width(_tb)/3;

//Data for drawing
var edgeW = _w - (cellSize*2);
var edgeH = _h - (cellSize*2);

var edgeScaleW = edgeW/cellSize;
var edgeScaleH = edgeH/cellSize;

//Text position
var tX = _x + cellSize;
var tY = _y + cellSize;

//Speaker
var spkMarg = 0; //Speaker photo/text margin

if (_speaker != undefined){
    //Get array
    var arr = global.speakers[| _speaker];
    
    //Get info
    var spkName = arr[ch.name];
    var spkSpr = arr[ch.spr];
    var spkInd = arr[ch.ind];
    
    //Scale
    var scl = 1;
    
    if (global.spkStretch){
        scl = (edgeH-(spkMarg*2)) / sprite_get_height(spkSpr);
    }
    
    //Adjust text
    tX += (sprite_get_width(spkSpr)*scl) + (spkMarg*2) + cellSize;
    tY += string_height(spkName) + spkMarg*2;
    
}
    
//Draw sprites

//Center
    //Stretched
    if (_stretch){
        draw_sprite_part_ext(_tb, _tbIn, cellSize, cellSize, cellSize, cellSize, _x + cellSize, _y + cellSize, edgeScaleW, edgeScaleH, -1, 1);
    }
    //Tiled
    else{
        for(var h=0; h<edgeH; h+=cellSize){
            for(var w=0; w<edgeW; w+=cellSize){
                var cX = _x + cellSize + w;
                var cY = _y + cellSize + h;
            
                draw_sprite_part(_tb, _tbIn, cellSize, cellSize, cellSize, cellSize, cX, cY);
            }
        }
    }
    
//Edges
    //Stretched
    if (_stretch){
        //Top
        draw_sprite_part_ext(_tb, _tbIn, cellSize, 0, cellSize, cellSize, _x + cellSize, _y, edgeScaleW, 1, -1, 1);
        
        //Bottom
        draw_sprite_part_ext(_tb, _tbIn, cellSize, cellSize*2, cellSize, cellSize, _x + cellSize, (_y + _h) - cellSize, edgeScaleW, 1, -1, 1);
        
        //Left
        draw_sprite_part_ext(_tb, _tbIn, 0, cellSize, cellSize, cellSize, _x, _y + cellSize, 1, edgeScaleH, -1, 1);
        
        //Right
        draw_sprite_part_ext(_tb, _tbIn, cellSize*2, cellSize, cellSize, cellSize, (_x + _w) - cellSize, _y + cellSize, 1, edgeScaleH, -1, 1);
    }
    //Tiled
    else{
        //Top
        for(var i=0; i<edgeW; i+=cellSize){
            var cX = _x + cellSize + i;
            
            draw_sprite_part(_tb, _tbIn, cellSize, 0, cellSize, cellSize, cX, _y);
        }
        
        //Bottom
        for(var i=0; i<edgeW; i+=cellSize){
            var cX = _x + cellSize + i;
            
            draw_sprite_part(_tb, _tbIn, cellSize, cellSize*2, cellSize, cellSize, cX, (_y + _h) - cellSize);
        }
        
        //Left
        for(var i=0; i<edgeH; i+=cellSize){
            var cY = _y + cellSize + i;
            
            draw_sprite_part(_tb, _tbIn, 0, cellSize, cellSize, cellSize, _x, cY);
        }
        
        //Right
        for(var i=0; i<edgeH; i+=cellSize){
            var cY = _y + cellSize + i;
            
            draw_sprite_part(_tb, _tbIn, cellSize*2, cellSize, cellSize, cellSize, (_x + _w) - cellSize, cY);
        }
    }

//Corners
    //Top left
    draw_sprite_part(_tb, _tbIn, 0, 0, cellSize, cellSize, _x, _y);
    
    //Top Right
    draw_sprite_part(_tb, _tbIn, cellSize*2, 0, cellSize, cellSize, (_x + _w) - cellSize, _y);
    
    //Bottom left
    draw_sprite_part(_tb, _tbIn, 0, cellSize*2, cellSize, cellSize, _x, (_y + _h) - cellSize);
    
    //Bottom Right
    draw_sprite_part(_tb, _tbIn, cellSize*2, cellSize*2, cellSize, cellSize, (_x + _w) - cellSize, (_y + _h) - cellSize);
    
//Draw text
draw_string(tX, tY, _text, -1, edgeW);

//Draw speaker
if (_speaker != undefined){
    //Sprite
        //Unstretched
        if (!global.spkStretch){
            draw_sprite(spkSpr, spkInd, _x + cellSize + spkMarg, _y + cellSize + spkMarg);
        }
        //Stretched
        else{
            draw_sprite_ext(spkSpr, spkInd, _x + cellSize + spkMarg, _y + cellSize + spkMarg, scl, scl, 0, -1, 1);
        }
    
    //Name
    draw_string(tX, _y + cellSize + spkMarg, spkName + ":");
}
    
    
//Return
return string_length(_text) >= string_length(_string);
