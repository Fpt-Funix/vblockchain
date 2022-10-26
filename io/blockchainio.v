module io
import core {Block,Transaction,BlockChain}
import os
import json
pub fn save_blockchain(blockchain BlockChain) {
	
	for block in blockchain.chain {
		save_block(block)
	 }
	
}
pub fn load_blockchain() BlockChain {
	
	mut blockchain:=Blockchain{
		chain: [],
		current_transactions: []
	}
	mut : current := 0
	while (os.exists('data/block_${current}.txt')) {
		blockchain.chain << json.decode(Block, os.read_file('data/block_${current}.txt')) or {
			panic(err)
		}
		current++
	}
	return blockchain
	
	
}
