module vblockio
import core {Account}

fn test_save_account () {
	account := Account {
		public_key: '0x0000000000000000000000000000000000000000'
		balance: 100
		nonce: 0
	}
	save_account(account)
}