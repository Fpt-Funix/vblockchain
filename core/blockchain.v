module core
import time

// struct definition Blockchain 
pub struct Blockchain {
	pub mut : chain []Block  // because we want to add blocks to the chain
	 current_transactions  []Transaction // list of pending transactions to be added to the next block
	 queue  []Transaction  // list of transactions that are waiting to be added to the chain
	 difficulty int = 1  // difficulty of the proof of work algorithm
}

pub struct CurrnetHash {
	previous_hash string
	hash_transaction string
}

pub fn (blockchain Blockchain) check_chain_validity()  bool {
	mut last_block := blockchain.chain[0]
	mut current_index := 1
	for blockchain.chain.len > current_index {
		mut block := blockchain.chain[current_index]
		// check that the hash of the block is correct
		if block.hash != block.hash() {
			println('Current hash is not equal to the calculated hash ${block.hash} != ${block.hash()}')
			return false
		}
		// check that previous hash is correct
		if block.previous_hash != last_block.hash {
			println(' ${block.previous_hash} != ${last_block.hash}')
			return false
		}
		last_block = block
		current_index++
	}
	return true
}

pub fn (blockchain Blockchain) check_chain_validity_thanh() bool {
	for i, block in blockchain.chain {
		if i == 0 {
			continue
		}
		if block.hash != block.hash() {
			println('Current hash is not equal to the calculated hash ${block.hash} != ${block.hash()}')
			return false
		}
		
		if block.previous_hash != blockchain.chain[i-1].hash {
			println(' ${block.previous_hash} != ${blockchain.chain[i-1].hash}')
			return false
		}
	}
	return true
}

pub fn (blockchain Blockchain) get_block_len()  int {
	return blockchain.chain.len
}

pub fn (mut blockchain Blockchain) add_new_block(block Block)   {
	if blockchain.validate_block(block) {
		blockchain.chain << block
		return
	}
}

pub fn (blockchain Blockchain) validate_block(block Block) bool {
	candicate_hash := block.hash()
	//println('candicate_hash ${candicate_hash}')
	if candicate_hash.substr(0, 5 * blockchain.difficulty) == 'caffe'
	{
		//println('block is valid')
		return true
	}
	return false
}

pub fn (mut blockchain Blockchain) add_new_transaction(transaction Transaction)  {
	blockchain.current_transactions << transaction
}


pub fn (mut blockchain Blockchain) validate_none(nonce int, miner string)  string {
	new_block := blockchain.create_next_block(nonce)
	if blockchain.validate_block(new_block) {
		blockchain.current_transactions = []Transaction{}
		new_transaction :=  blockchain.create_transaction(miner, nonce)
		blockchain.current_transactions << new_transaction
		blockchain.chain << new_block
		return 'valid'
	}
	return 'invalid'
}

pub fn (blockchain Blockchain) create_next_block(nonce int)  Block {
	mut block := Block{
		index: blockchain.get_block_len() + 1
		transactions: blockchain.current_transactions
		previous_hash: blockchain.chain.last().hash
		nonce: nonce
		timestamp: int(time.now().unix)
	}
	block.hash = block.hash()
	return block
}

pub fn (blockchain Blockchain) create_transaction(miner string, nonce int) Transaction {
	mut transaction := Transaction{
		sender: '0x0000000000000000000000000000000000000000'
		recipient: miner
		amount: 1
		timestamp: int(time.now().unix)
		nonce: nonce
	}
	transaction.hash = transaction.hash()
	return transaction
}

pub fn (blockchain Blockchain) previous_hash_and_hash_transaction() CurrnetHash {
	current_hash := CurrnetHash{
		previous_hash: blockchain.chain.last().hash
		hash_transaction: blockchain.current_transactions.map(it.hash()).join('')
	}
	return current_hash
}


