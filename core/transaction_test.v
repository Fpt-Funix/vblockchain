module core
fn test_create_transaction()
{
	tx:=Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}
	assert tx.hash == '0x123'

}

