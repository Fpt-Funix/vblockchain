module main
import core {Block,Blockchain,Transaction}
fn main() {
       tx1:=Transaction{
		hash: '0x1232',
		sender: '0x4562',
		recipient: '0x7892',
		amount: 100,
		timestamp: 1234567890
	}

	

	for i:=0;i<100_000_000;i++{
		block0:=Block{
		index: 0,
		previous_hash: '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000caffe',
		timestamp: 1234567890,
		transactions: [tx1],
		nonce: i
		hash: ''

		}
		if block0.hash().substr(0, 5*1) == 'caffe'{
			println(block0)
			break
		}
	}
	
}