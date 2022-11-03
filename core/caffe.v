module core

pub fn  init_caffe_blockchain() Blockchain{
	tx:=Transaction{
		hash: 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF',
		sender: '0000000000000000000000000000000000000000000000000000000000000000',
		recipient: '3ec605156645d171fb0cfff08bb895d0739715f38b4d87fea0ec105717c4efe4',
		amount: 100,
		timestamp: 1234567890
	}
	block0:=Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx],
		nonce: 1669502
		merkle_root_hash: 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
		hash: 'caffe2b6f6b82b43df3ff77bd4d1dbf26140b578be6914161d3c949e924f1d4267c099e199564ef2e7d123f35baec9e689c73c8bb5bd91d01b136c5ef1f30f33'
	}
	mut caffe:=Blockchain{
		chain: [],
		current_transactions: []
		difficulty : 1
	}
	// add block 0 to the chain
	caffe.chain << block0
	return caffe
}