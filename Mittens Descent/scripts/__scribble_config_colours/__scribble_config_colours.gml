// Feather disable all
/// Creates a collection of colour names that map to 24-bit BGR colours
/// Use scribble_rgb_to_bgr() to convert from industry standard RGB colour codes to GM's native BGR format
/// 
/// To add or change colours at runtime, use scribble_color_set()
/// 
/// N.B. That this function is executed on boot. You should never execute this function yourself!
#macro C_WHITE	#daf2e9
#macro C_LTGRAY	#95e0cc
#macro C_GRAY	#39707a
#macro C_DKGRAY #23495d
#macro C_BLACK	#1c2638
#macro C_RED	#f14e52
#macro C_MAROON #daf2e9
function __scribble_config_colours()
{
    static _colours = {
        //Duplicate GM's native colour constants
        c_aqua:    C_LTGRAY,
        c_black:   C_BLACK,
        c_blue:    C_DKGRAY,
        c_dkgray:  C_DKGRAY,
        c_dkgrey:  C_DKGRAY,
        c_gray:    C_GRAY,
        c_green:   C_GRAY,
        c_grey:    C_GRAY,
        c_ltgray:  C_LTGRAY,
        c_ltgrey:  C_LTGRAY,
        c_maroon:  C_MAROON,
        c_navy:    C_BLACK,
        c_orange:  C_RED,
        c_red:     C_RED,
        c_silver:  C_WHITE,
        c_teal:    C_LTGRAY,
        c_white:   C_WHITE,
    
        //Here are some example colours
        c_coquelicot: scribble_rgb_to_bgr(0xff3800),
        c_smaragdine: scribble_rgb_to_bgr(0x50c875),
        c_xanadu:     scribble_rgb_to_bgr(0x738678),
        c_amaranth:   scribble_rgb_to_bgr(0xe52b50),
    };
    
    return _colours;
}
