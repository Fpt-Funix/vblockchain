module vblockio
import core {Block,Transaction}
import os
import json


fn test_save_block() {

	
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
		nonce: 33293
		hash: 'caffe2b6f6b82b43df3ff77bd4d1dbf26140b578be6914161d3c949e924f1d4267c099e199564ef2e7d123f35baec9e689c73c8bb5bd91d01b136c5ef1f30f33'

	}
	save_block(block0)
	
	
}
fn test_save_then_load_block() {

	
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
		nonce: 33293
		hash: 'caffe2b6f6b82b43df3ff77bd4d1dbf26140b578be6914161d3c949e924f1d4267c099e199564ef2e7d123f35baec9e689c73c8bb5bd91d01b136c5ef1f30f33'

	}
	save_block(block0)
	block_zero := load_block(0) or { panic('block not found') }
	assert block_zero.hash == block0.hash
	
}
