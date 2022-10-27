module core
import crypto.sha512

pub struct Block{
	pub : index  int
	transactions []Transaction
	previous_hash string
	nonce int	
	timestamp int
	pub mut : hash string 
}

pub fn (b Block) hash() string{
	mut hash_trans := ""
	// for (var i=0; i<b.transactions.length; i++){
	for t in b.transactions
	{
		hash_trans += t.hash
		
	}
	return sha512.hexhash(b.previous_hash + b.nonce.str()+hash_trans)
}
