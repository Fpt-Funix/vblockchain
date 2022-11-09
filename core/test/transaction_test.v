import core {Transaction,create_new_account}
fn test_create_transaction()
{
	account1:=create_new_account()!
	account2:=create_new_account()!
	
	mut tx:=Transaction{
		hash: '',
		sender: account1.public_key,
		recipient: account2.public_key,
		amount: 100,
		timestamp: 1234567890,
		//nonce: account1.nonce
	}
	assert tx.nonce == 0
	tx.hash = tx.hash()

	sign:=tx.sign(account1.private_key)!
	
	assert tx.verify()! == true


}

