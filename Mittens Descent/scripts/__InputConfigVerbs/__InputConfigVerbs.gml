function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        UP,
        DOWN,
        LEFT,
        RIGHT,
        PRIMARY,
		SECONDARY,
		START
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        NAVIGATION,
    }
    
    if (not INPUT_ON_SWITCH)
    {
        InputDefineVerb(INPUT_VERB.UP,      "up",          vk_up,         -gp_axislv);
        InputDefineVerb(INPUT_VERB.DOWN,    "down",        vk_down,        gp_axislv);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",        vk_left,       -gp_axislh);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",       vk_right,       gp_axislh);
        InputDefineVerb(INPUT_VERB.PRIMARY,  "accept",     vk_space,       gp_face1);
        InputDefineVerb(INPUT_VERB.SECONDARY,"cancel",     vk_backspace,   gp_face2);
		InputDefineVerb(INPUT_VERB.START, "start", vk_escape, gp_start);
    }
    else //Flip A/B over on Switch
    {
        InputDefineVerb(INPUT_VERB.UP,      "up",      undefined,   -gp_axislv);
        InputDefineVerb(INPUT_VERB.DOWN,    "down",    undefined,    gp_axislv);
        InputDefineVerb(INPUT_VERB.LEFT,    "left",    undefined,   -gp_axislh);
        InputDefineVerb(INPUT_VERB.RIGHT,   "right",   undefined,    gp_axislh);
        InputDefineVerb(INPUT_VERB.PRIMARY,  "accept",  undefined,   gp_face2); // !!
        InputDefineVerb(INPUT_VERB.SECONDARY,"cancel",  undefined,   gp_face1); // !!
		InputDefineVerb(INPUT_VERB.START, "start", undefined, gp_start);
    }
    
    //Define a cluster of verbs for moving around
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}
