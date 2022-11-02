module core
import crypto.sha512
import crypto.ed25519
import encoding.hex

pub struct Transaction {
	mut: hash string
	sender string
	recipient string
	amount int
	timestamp int
	nonce u64
	signature string
}

pub fn (t Transaction) hash() string{
	// nonce + from + amount + to + pre
	return sha512.hexhash(t.nonce.str() + t.sender + t.amount.str() + t.recipient)
}
pub fn (t Transaction) validate() {
	assert t.hash() == t.hash

}
pub fn (mut t Transaction) sign( private_key string) !string {
	
	sig := ed25519.sign(hex.decode(private_key)!, hex.decode(t.hash())!)!
	t.signature=sig.hex()
	return t.signature
}
pub fn (t Transaction) verify() !bool {

	
	return ed25519.verify(hex.decode(t.sender)!, hex.decode(t.hash())!, hex.decode(t.signature)!)!
	
	
}