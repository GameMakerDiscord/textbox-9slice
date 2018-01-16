/// tb_init()
/// Initializes data for the textboxes
//Textbox options
global.tbWidth = -1;
global.tbHeight = -1;

global.tbSprite = sTextbox;
global.tbIndex = 0;

//Textbox text speed
//global.tbSpeed = 1;

//Speaker options
global.spkStretch = true; //Stretch the speaker photo?

//Characters
enum ch{
    name, spr, ind
}

global.speakers = ds_list_create();
