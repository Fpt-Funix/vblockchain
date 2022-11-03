module core
import crypto.ed25519
import encoding.hex
pub struct Account {
	pub : balance u64
	nonce u64
	public_key string
	private_key string
}


pub fn create_new_account() !Account{
	// generate a new key pair
	public_key, private_key := generate_key_pair()!
	account := Account{
		balance : 0,
		nonce : 0,
		public_key : public_key,
		private_key : private_key,
	}

	return account
}

pub fn generate_key_pair() !(string,string){
	public_key, private_key := ed25519.generate_key()!
	return hex.encode(public_key), hex.encode(private_key)
}