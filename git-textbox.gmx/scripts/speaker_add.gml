/// speaker_add(name, sprite, subimg);
// Creates a new speaker for the textboxes, returns ID

//Args
var _name = argument[0];
var _spr = argument[1];
var _ind = argument[2];

//Create
ds_list_add(global.speakers, cArr(_name, _spr, _ind));

return ds_list_size(global.speakers) - 1;

