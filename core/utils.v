module core

fn get_default_account() (Account,Account){
	bob:= Account{
		balance: 0
		nonce: 0
		public_key: '3ec605156645d171fb0cfff08bb895d0739715f38b4d87fea0ec105717c4efe4'
		private_key: 'dab283f30f169849ee498a9ca1b39e7340b4bd73611e60269333eb791303fe773ec605156645d171fb0cfff08bb895d0739715f38b4d87fea0ec105717c4efe4'  
	}

	alice:= Account { 
		balance: 0
		nonce: 0
		public_key: '0a2fe4496ca4d398a0066771408e0147b7afecdb7f1a0fba30536265de82ad42'
		private_key: '32e6780316c29dca5afed98a3b1f8e06712e7ca90b02ddba62f790669227d5290a2fe4496ca4d398a0066771408e0147b7afecdb7f1a0fba30536265de82ad42'  
	}

	return bob,alice

}

fn create_transaction_from_account(from Account,to Account, amount u64) Transaction{
	mut tx:=Transaction{
		hash: '',
		sender: from.public_key,
		recipient: to.public_key,
		amount: 100,
		timestamp: 1234567890,
		nonce: from.nonce,
		signature: ''
	}
	tx.hash = tx.hash()
	tx.signature = tx.sign(from.private_key) or {panic('failed to sign transaction')}
	return tx


}