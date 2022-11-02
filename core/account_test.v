module core



pub fn test_create_accoun() {
	
	
	
	public_key,private_key := generate_key_pair()!

	//assert public_key == "df8458979e83235ef99c632f50b1a3e6de21f7e12d23a543aed4bee6df303dcd"
	//assert private_key == "01015118ea5c1af94f1b3f92f258a7baa4fd4046bc43c073ecb5bfc97b63d8ba7979e1420796ecc8fbe445dc66d7c66acc4efc7c368395fa9d977144dfd85474"
	assert public_key.len == 64
	assert private_key.len == 128


}



	