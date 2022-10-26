module core

// struct definition Blockchain 
pub struct Blockchain {
	mut : chain []Block // because we want to add blocks to the chain
	current_transactions []Transaction // list of pending transactions to be added to the next block
}
pub fn (blockchain Blockchain) check_chain_validity()  bool {
	mut last_block := blockchain.chain[0]
	mut current_index := 1
	for blockchain.chain.len > current_index {
		mut block := blockchain.chain[current_index]
		// check that the hash of the block is correct
		if block.hash != block.hash() {
			return false
		}
		// check that previous hash is correct
		if block.previous_hash != last_block.hash {
			return false
		}
		last_block = block
		current_index++
	}
	return true
}