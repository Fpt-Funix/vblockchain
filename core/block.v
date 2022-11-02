module core
import crypto.sha512

pub struct Block{
	pub : index  int
	transactions []Transaction
	previous_hash string
	nonce int	
	timestamp int
	merkle_root_hash string
	pub mut : hash string 
}




pub fn (b Block) hash() string{
	return sha512.hexhash(b.previous_hash + b.nonce.str() + b.merkle_root_hash)
}
