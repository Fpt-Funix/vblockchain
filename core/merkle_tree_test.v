module core


fn test_create_tree() {
	
	

	tx1:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}
	tx2:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}

	mut transactions:=[]Transaction{}
	transactions << tx1
	//transactions << tx2
	//tree:=create_merkle_tree(transactions)
	//assert tree.root.hash=="aaa"
}
