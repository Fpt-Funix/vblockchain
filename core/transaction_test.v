module core
fn test_create_transaction()
{
	mut bc:=Blockchain{
		chain: [],
		current_transactions: []
	}
	tx:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890,
		nonce: 1
	}
	assert tx.hash == '0x123'
// nonce + from + amount + to
	tx1:=Transaction{
		hash: 'c4f5a5b3ea14132761742af836c503f907e6eba168324864f1b46d4aca15b0a4c376cc68c2dacd632cd80d1d48ef77008323a0c9c6127eaf9c831af584b2695f',
		sender: '0x4564',
		recipient: '0x7894',
		amount: 100,
		timestamp: 1234567894
		nonce: 2
	}

	assert tx1.hash == 'c4f5a5b3ea14132761742af836c503f907e6eba168324864f1b46d4aca15b0a4c376cc68c2dacd632cd80d1d48ef77008323a0c9c6127eaf9c831af584b2695f'
}

