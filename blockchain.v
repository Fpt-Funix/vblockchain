module main
import core {Transaction,Block,Blockchain}


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

	// Create new Block
	block:=Block{
		transactions: [tx, tx1],
		previous_hash: '0x123',
		nonce: 123
	}

	println(block.hash())
}
