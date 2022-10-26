module io
import core {Block,Transaction,Blockchain}
pub fn save_blockchain(blockchain Blockchain) {
	
	for block in blockchain.chain {
		save_block(block)
	 }
	
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
