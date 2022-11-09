import core {Transaction,create_merkle_tree}

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
	transactions << tx2
	tree:=create_merkle_tree(transactions)
	assert tree.root.hash=="4007e78a560685803d9db06c7f8656d4fbb9c788930ae7a27ce2e314fde3a5d0be82a1309356ee307e127866c4c3477dfc3328c1ab190b580fd7552b30e8143a"
}
