module core

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
		previous_hash: '0x000000000000000',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: 123
	}
	assert block0.hash == '0x0000000000000000000000000000000000000000000000000000000000000000'
	tx2:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}
	block1:=Block{
		index: 0,
		previous_hash: '0x000000000000000',
		timestamp: 1234567890,
		transactions: [tx2],
		nonce: 123
	}
	bc.chain <<  block0
	bc.chain <<  block1
	assert bc.check_chain_validity() == true

}