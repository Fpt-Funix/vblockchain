module main
import core {Block,Blockchain,Transaction}
fn main() {


	blockchain := Blockchain{
		difficulty: 1

	}

    tx1:=Transaction{
		hash: '0x1232',
		sender: '0x4562',
		recipient: '0x7892',
		amount: 100,
		timestamp: 1234567890
	}
	
	block0:=Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: 33293
		hash: ''
	}



	max_value:= 100_000


	for i:=0;i<max_value;i++{
		mut next_block:=Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: i
		hash: ''

		}
		
		if blockchain.validate_block(next_block){
			next_block.hash=next_block.hash()
			println(next_block)
			break
		}
		
		
	}
	
}