module core



// need to rewrite this to use the new hash system
fn test_create_blockchain(){

	mut bc:=Blockchain{
		chain: [],
		current_transactions: []
	}

}
fn test_init_caffe_blockchain(){

	mut blockchain:= init_caffe_blockchain()
	assert blockchain.chain.len==1

}