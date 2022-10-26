module main
import crypto.sha512

pub struct Block{
	transactions []Transaction
	previous_hash string
	nonce int
}

pub struct Transaction {

	hash string
	sender string
	recipient string
	amount int
	timestamp int
}

pub struct Chain{
	chain []Block
}

pub fn (b Block) hash() string {
	return sha512.hexhash(b.transactions.str() + b.previous_hash + b.nonce.str())
}
    

fn main() {
	println('Hello World!')
	// Create new Transaction
	tx:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}

	// tx.hash='0x456' // error: cannot assign to field `hash` of immutable binding `tx`
	println(tx)

	tx1:=Transaction{
		hash: '0x1234',
		sender: '0x4564',
		recipient: '0x7894',
		amount: 104,
		timestamp: 1234567894
	}
	println(tx1)

	tx2:=Transaction{
		hash: '0x1235',
		sender: '0x4565',
		recipient: '0x7895',
		amount: 105,
		timestamp: 1234567895
	}
	println(tx2)

	// Create new Block
	block:=Block{
		transactions: [tx, tx1],
		previous_hash: '0x123',
		nonce: 123
	}

	println(block)

	block1:=Block{
		transactions: [tx2],
		previous_hash: '0x1234',
		nonce: 1234
	}

	// Create new Chain
	chain:=Chain{
		chain: [block, block1]
	}

	println(chain)
}
