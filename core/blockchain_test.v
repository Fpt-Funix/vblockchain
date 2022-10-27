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
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: 123
		hash : '25745fe90c01ddf4d19a4c2f6f2ffcb19d065b6eaca3f66c76be797db3c3c53ea9289b7742d88c3b6d305e9d8fafe9c7254198fd7102734c944a9264213328b7'
	}
	
	assert block0.hash() == '25745fe90c01ddf4d19a4c2f6f2ffcb19d065b6eaca3f66c76be797db3c3c53ea9289b7742d88c3b6d305e9d8fafe9c7254198fd7102734c944a9264213328b7'
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
		previous_hash: '25745fe90c01ddf4d19a4c2f6f2ffcb19d065b6eaca3f66c76be797db3c3c53ea9289b7742d88c3b6d305e9d8fafe9c7254198fd7102734c944a9264213328b7',
		timestamp: 1234567890,
		transactions: [tx2,tx3],
		nonce: 124
		hash : '3a36cce47f8d6bd71b3cf95a80c683a77c941060a89b5538cac223ca2c00f56f90aed94d6d5cbb744ff135c461bacdc0b81b616f098e956920f99b24d3c2eb68'
	}
	bc.chain <<  block0
	bc.chain <<  block1
	assert bc.check_chain_validity() == true

	assert bc.get_block_len() == 2
	
}