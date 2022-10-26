module core
import crypto.sha512

pub struct Transaction {
	hash string
	sender string
	recipient string
	amount int
	timestamp int
	nonce int
}

pub fn (t Transaction) hash() string{
	// nonce + from + amount + to + pre
	return sha512.hexhash(t.nonce.str() + t.sender + t.amount.str() + t.recipient)
}
