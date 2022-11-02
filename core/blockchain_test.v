module core
// need to rewrite this to use the new hash system
fn test_create_blockchain()
{
	

	mut bc:=Blockchain{
		chain: [],
		current_transactions: []
	}

	tx1:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}

	block0:=Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: 85165
		hash : 'caffef21b33ce84c5db9584b7626c1e249f873d70ca7a3eda5f367dbba8a3a730a5079074ff0db6674e73168179104ba4985ed59117139c95dd8a953af039fd5'
	}
	
	assert block0.hash() == 'caffef21b33ce84c5db9584b7626c1e249f873d70ca7a3eda5f367dbba8a3a730a5079074ff0db6674e73168179104ba4985ed59117139c95dd8a953af039fd5'
	tx2:=Transaction{
		hash: '0x1232',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}

	tx3:=Transaction{
		hash: '0x1233',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}

	block1:=Block{
		index: 0,
		previous_hash: 'caffef21b33ce84c5db9584b7626c1e249f873d70ca7a3eda5f367dbba8a3a730a5079074ff0db6674e73168179104ba4985ed59117139c95dd8a953af039fd5',
		timestamp: 1234567890,
		transactions: [tx2,tx3],
		nonce: 124
		hash : '3a36cce47f8d6bd71b3cf95a80c683a77c941060a89b5538cac223ca2c00f56f90aed94d6d5cbb744ff135c461bacdc0b81b616f098e956920f99b24d3c2eb68'
	}
	bc.chain <<  block0
	bc.chain <<  block1
	assert block1.hash() == '009cf5c311710a742cd2f494766d43b16147bfac2b66687ac965238c78c99a598e0f1c96cc62b9777ed114693b54e12b2de225373c623420f48192d5411a9b26'
//	assert bc.check_chain_validity() == true
	assert bc.check_chain_validity() == bc.check_chain_validity_thanh()
	assert bc.get_block_len() == 2
	
}