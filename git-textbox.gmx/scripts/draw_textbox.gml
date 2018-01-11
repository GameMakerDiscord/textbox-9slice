/// draw_textbox(x, y, string);
// args: x, y, string, [characters, speaker, center, w, h, textbox_sprite, textbox_index, stretch_center]

//Args
var _x = argument[0];
var _y = argument[1];
var _string = argument[2];

//Optional args
//Optional args are handled by separate scripts
var _char = ternary(argument_count > 3, argument[3], -1); //How many characters to display, -1 for all
var _speaker = ternary(argument_count > 4, argument[4], undefined); //Who is the speaker? (Using speaker_add())
var _center = ternary(argument_count > 5, argument[5], false); //Whether to draw the textbox in the center
var _w = ternary(argument_count > 6, argument[6], undefined); //Width of the textbox, undefined for GUI width
var _h = ternary(argument_count > 7, argument[7], undefined); //Height of the textbox, undefined for GUI height
var _tb = ternary(argument_count > 8, argument[8], sTextbox); //Textbox sprite
var _tbIn = ternary(argument_count > 9, argument[9], 0); //Textbox image index
var _stretch = ternary(argument_count > 10, argument[10], 1); //Whether to stretch the center part of the textbox or tile it (if false)

//Text to display
var _text = ternary(_char >= 0, string_copy(_string, 1, _char), _string);

//Properties
var _tbHeight = 0.2;

//Data
var guiH = display_get_gui_height();
var guiW = display_get_gui_width();

//Size
_w = ternary(_w == undefined, guiW, _w);
_h = ternary(_h == undefined, guiH * _tbHeight, _h);

//Position
_x = ternary(_x == undefined, 0, _x);
_y = ternary(_y == undefined, guiH - _h, _y);

//Sprite sizes
var cellSize = sprite_get_width(_tb)/3;

//Data for drawing
var edgeW = _w - (cellSize*2);
var edgeH = _h - (cellSize*2);

var edgeScaleW = edgeW/cellSize;
var edgeScaleH = edgeH/cellSize;
    
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
                var cX, cY;
                cX = _x + cellSize + w;
                cY = _y + cellSize + h;
            
                draw_sprite_part(_tb, _tbIn, cellSize, cellSize, cellSize, cellSize, cX, cY);
            }
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
    
//Edges
    //Top
    draw_sprite_part_ext(_tb, _tbIn, cellSize, 0, cellSize, cellSize, _x + cellSize, _y, edgeScaleW, 1, -1, 1);
    
    //Bottom
    draw_sprite_part_ext(_tb, _tbIn, cellSize, cellSize*2, cellSize, cellSize, _x + cellSize, (_y + _h) - cellSize, edgeScaleW, 1, -1, 1);
    
    //Left
    draw_sprite_part_ext(_tb, _tbIn, 0, cellSize, cellSize, cellSize, _x, _y + cellSize, 1, edgeScaleH, -1, 1);
    
    //Right
    draw_sprite_part_ext(_tb, _tbIn, cellSize*2, cellSize, cellSize, cellSize, (_x + _w) - cellSize, _y + cellSize, 1, edgeScaleH, -1, 1);
    
//Draw text
draw_string(_x + cellSize, _y + cellSize, _text);
    
    
    
