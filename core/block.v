module core
import crypto.sha512

pub struct Block{
	pub : index  int
	transactions []Transaction
	previous_hash string
	nonce int	
	timestamp int
	pub mut : merkle_root_hash string
	hash string 
}

pub fn (block &Block) merkle_root_hash() string {
	return create_merkle_tree(block.transactions).root.hash
}


pub fn (b Block) hash() string{
	return sha512.hexhash(b.previous_hash + b.nonce.str() + b.merkle_root_hash)
}
