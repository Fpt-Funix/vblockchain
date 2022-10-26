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
		hash : 'fd8d4de22dc63b44eb3e94d34afc382d4322ce7b137f8ae9946fa540e68e9eadb9685421107341f7edb948b95fb15e3cb44620210aa020998990f5370ade4420'
	}
	
	assert block0.hash() == 'fd8d4de22dc63b44eb3e94d34afc382d4322ce7b137f8ae9946fa540e68e9eadb9685421107341f7edb948b95fb15e3cb44620210aa020998990f5370ade4420'
	tx2:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}
	block1:=Block{
		index: 0,
		previous_hash: 'fd8d4de22dc63b44eb3e94d34afc382d4322ce7b137f8ae9946fa540e68e9eadb9685421107341f7edb948b95fb15e3cb44620210aa020998990f5370ade4420',
		timestamp: 1234567890,
		transactions: [tx2],
		nonce: 124
		hash : '325397526d66695e00efb8d789763a230f01b650b0ea02f0e8d1d7c7024bdf3ce71da4c0ea5860c6edd3f1e5247e7865e2d7c3097fc59fc4bc186f2789bad27e'
	}
	bc.chain <<  block0
	bc.chain <<  block1
	assert bc.check_chain_validity() == true

}