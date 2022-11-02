module core
fn test_create_block0()
{
	tx:=Transaction{
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
		transactions: [tx],
		nonce: 123
	}

	assert block0.index == 0
	assert block0.previous_hash == '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe','Hash of block -1 need to fixed value 0x...0caffe'

}
fn test_create_block0_with_hash()
{
	tx1:=Transaction{
		hash: '0x1232',
		sender: '0x4562',
		recipient: '0x7892',
		amount: 100,
		timestamp: 1234567890
	}

	block0:=Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: 85165
		hash: 'caffef21b33ce84c5db9584b7626c1e249f873d70ca7a3eda5f367dbba8a3a730a5079074ff0db6674e73168179104ba4985ed59117139c95dd8a953af039fd5'

	}
	assert block0.hash == block0.hash()
}
fn test_create_block0_with_hash_and_nonce()
{
	tx1:=Transaction{
		hash: '0x1232',
		sender: '0x4562',
		recipient: '0x7892',
		amount: 100,
		timestamp: 1234567890
	}

	block0:=Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: 85165
		hash: 'caffef21b33ce84c5db9584b7626c1e249f873d70ca7a3eda5f367dbba8a3a730a5079074ff0db6674e73168179104ba4985ed59117139c95dd8a953af039fd5'

	}
	assert block0.hash == block0.hash() , 'Hash of block 0 is not correct caffe2b6f6b82b43df3ff77bd4d1dbf26140b578be6914161d3c949e924f1d4267c099e199564ef2e7d123f35baec9e689c73c8bb5bd91d01b136c5ef1f30f33'
}
