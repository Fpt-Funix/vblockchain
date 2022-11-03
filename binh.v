module main
import core



fn main() {
	binh_account := core.Account{
		balance: 0
		nonce: 0
		public_key: '3ec605156645d171fb0cfff08bb895d0739715f38b4d87fea0ec105717c4efe4'
		private_key: 'dab283f30f169849ee498a9ca1b39e7340b4bd73611e60269333eb791303fe773ec605156645d171fb0cfff08bb895d0739715f38b4d87fea0ec105717c4efe4'  
	}

	account2 := core.Account { 
		balance: 0
		nonce: 0
		public_key: '0a2fe4496ca4d398a0066771408e0147b7afecdb7f1a0fba30536265de82ad42'
		private_key: '32e6780316c29dca5afed98a3b1f8e06712e7ca90b02ddba62f790669227d5290a2fe4496ca4d398a0066771408e0147b7afecdb7f1a0fba30536265de82ad42'  
	}

	// Create a transaction
	mut binh_tx := core.Transaction {
		hash: "",
		sender: binh_account.public_key,
		recipient: account2.public_key,
		amount: 100,
		timestamp: 1233341241,
		nonce: binh_account.nonce
	}

	binh_tx.hash = binh_tx.hash()
	sig := binh_tx.sign(binh_account.private_key) or {panic("Failed to sign")}

	assert sig == 'eecb3f0093c65fd5f390826ca0d5eeafee4f43eecd95e2aa25dd189ca58702b4faf380427cfb68435b1b762c02f6d56a162ff52fbd87864105c6cdcc4ff31f01'
}