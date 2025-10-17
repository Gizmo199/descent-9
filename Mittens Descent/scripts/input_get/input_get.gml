function input_get(_binding){
	switch(_binding)
	{
		case eBinding.Left		: return InputCheck(INPUT_VERB.LEFT); break;
		case eBinding.Right		: return InputCheck(INPUT_VERB.RIGHT); break;
		case eBinding.Down		: return InputCheck(INPUT_VERB.DOWN); break;
		case eBinding.Up		: return InputCheck(INPUT_VERB.UP); break;
		case eBinding.Jump		: return InputCheck(INPUT_VERB.JUMP); break;
		case eBinding.Primary	: return InputCheck(INPUT_VERB.PRIMARY); break;
		case eBinding.Secondary : return InputCheck(INPUT_VERB.SECONDARY); break;
	}
	return 0;
}