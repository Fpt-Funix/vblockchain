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
		nonce: 123
		hash: '5c4ccfc7c94b6c37631a9161176bd30b9f89af4ce63beaa191faf063c9856b81a7f9ba509145888e4d02dcdb5537d6077eff3db264a7ba8fff99e5db21660e99'

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
		nonce: 33293
		hash: 'caffe2b6f6b82b43df3ff77bd4d1dbf26140b578be6914161d3c949e924f1d4267c099e199564ef2e7d123f35baec9e689c73c8bb5bd91d01b136c5ef1f30f33'

	}
	assert block0.hash == block0.hash() , 'Hash of block 0 is not correct 0xcaffe2b6f6b82b43df3ff77bd4d1dbf26140b578be6914161d3c949e924f1d4267c099e199564ef2e7d123f35baec9e689c73c8bb5bd91d01b136c5ef1f30f33'
}
