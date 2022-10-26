module main

struct Transaction {

	hash string
	sender string
	recipient string
	amount int
	timestamp int
}

    

fn main() {
	println('Hello World!')
	tx:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}

	// tx.hash='0x456' // error: cannot assign to field `hash` of immutable binding `tx`
	println(tx)
}
