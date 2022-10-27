module core

struct MerkleNode{ 
    pub : hash string
    transaction Transaction
	left &MerkleNode
	right &MerkleNode
}
pub fn (node MerkleNode) hash() string {
	return node.hash
}


struct MerkleTree{
	root MerkleNode
}
 
