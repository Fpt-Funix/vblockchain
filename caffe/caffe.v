module caffe
import core

pub fn  init_caffe_blockchain() core.Blockchain{
	tx1:=core.Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}
	block0:=core.Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: 33293
		hash: 'caffe2b6f6b82b43df3ff77bd4d1dbf26140b578be6914161d3c949e924f1d4267c099e199564ef2e7d123f35baec9e689c73c8bb5bd91d01b136c5ef1f30f33'
	}
	mut caffe:=core.Blockchain{
		chain: [],
		current_transactions: []
		difficulty : 1
	}
	// add block 0 to the chain
	caffe.chain << block0
	
	return caffe
}