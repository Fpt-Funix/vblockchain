module core
import crypto.sha512
struct MerkleNode{ 
    pub mut : hash string
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
	unsafe{
		node:=MerkleNode{
			hash: transaction.hash
			left: nil
			right: nil
		}
		
		return node
	}
}

pub fn create_merkle_tree(transactions []Transaction) MerkleTree{
	
	// loop over nodes and add left and right nodes to buil merkle tree
	if transactions.len == 0 { 
		transaction:= Transaction{
			hash: '0x000000000000000000000000000000000'
			
		}
		return MerkleTree{
			
			root: create_merkle_node(transaction)
		}
	}
	
	if transactions.len == 1 {
		return MerkleTree{
			root: create_merkle_node(transactions[0])
		}
	}
	// loop over transactions and create merkle nodes
	mut nodes :=[] MerkleNode{}
	for transaction in transactions{
		nodes << create_merkle_node(transaction)
	}
	// loop over nodes and add left and right nodes to build merkle tree
	unsafe {
		for nodes.len > 1{
			mut new_nodes :=[] MerkleNode{}
			for i:=0; i < nodes.len; i+=2{
				if i+1 == nodes.len{
					new_nodes << nodes[i]
				}else{
					 node :=MerkleNode{
						left: &nodes[i]
						right: &nodes[i+1]
					}
					node.hash()
					new_nodes <<node
					
				}
			}
			nodes = new_nodes.clone()
		}
	}
	



	tree :=MerkleTree{
		root: nodes[0]
	}
	
	return tree
}
 
