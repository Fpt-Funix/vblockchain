// Copyright (c) 2022 Bui Dinh Ngoc (aka NgocBD). All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module core
import crypto.ed25519
import encoding.hex


// Struct for Account in blockchain it basicly contain public key and balance
pub struct Account {
	pub : balance u64
	nonce u64 // nonce is used to prevent replay attack and double spend it uasually is the number of transaction that account has sent
	public_key string // public key of account in hex format
	private_key string // private key of account in hex format
}

// Utility function to create new account
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
 
// Utility function to generate a new key pair
// vblockchain use ed25519 algorithm to generate key pair
pub fn generate_key_pair() !(string,string){
	public_key, private_key := ed25519.generate_key()!
	return hex.encode(public_key), hex.encode(private_key)
}

