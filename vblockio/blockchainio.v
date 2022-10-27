module vblockio
import core {Block,Transaction,Blockchain}
import os
pub fn save_blockchain(blockchain Blockchain) {
	
	for block in blockchain.chain {
		println('save block ${block.index}')
		save_block(block)
	 }
	
}
pub fn have_data() bool {
	return os.exists('data')
}
pub fn load_blockchain() Blockchain {
	
	mut blockchain:=Blockchain{
		chain: [],
		current_transactions: []
	}
	mut  current := 0
	for {
		
		blockchain.chain << load_block(current) or {
			break
		}
		current++
	}
	return blockchain
	
	
}
