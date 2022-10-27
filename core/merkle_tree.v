module core
import crypto.sha512
struct MerkleNode{ 
    pub mut : hash string
    transaction Transaction
	left &MerkleNode
	right &MerkleNode
}
pub fn (mut node MerkleNode) hash() string {
	node.hash = sha512.hexhash(node.left.hash + node.right.hash)
	return node.hash
}


struct MerkleTree{
	root MerkleNode
}
pub fn create_merkle_node(transaction Transaction) MerkleNode{
	node:=MerkleNode{
		transaction: transaction
	}
	
	return node
}
pub fn create_merkle_tree(transactions []Transaction) MerkleTree{
	// mut nodes :=[] MerkleNode 
	// for transaction in transactions{
	// 	nodes << create_merkle_node(transaction)
	// }

	// loop over nodes and add left and right nodes to buil merkle tree
	if transactions.len == 1{
		return MerkleTree{
			root: create_merkle_node(transactions[0])
		}
	}
	
	if transactions.len == 0{
		error('no transactions')
	}
	
	



	tree :=MerkleTree{
		root: create_merkle_node(transactions[0])
	}
	
	return tree
}
 
