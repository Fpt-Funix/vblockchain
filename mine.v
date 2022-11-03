module main
import core {Block,Blockchain,Transaction}
import time
fn main() {


	mut blockchain := core.init_caffe_blockchain()

	max_value:= 1_000_000_000
	
	for block in 1..100 {
		begin := time.now()
		mut counter := 0
		for i:=0;i<max_value;i++{
			counter++
			mut next_block:=Block{
			index: block,
			previous_hash: blockchain.chain.last().hash,
			timestamp: int(time.now().unix),
			transactions: [],
			nonce: i
			hash: ''

			}
			
			if blockchain.validate_block(next_block){
				next_block.hash=next_block.hash()
				next_block.merkle_root_hash = next_block.merkle_root_hash()
				println(next_block)
				blockchain.chain<<next_block
				break
			}
			
			
		}
		end := time.now()
		println('Time taken for block $block is ${(end-begin).seconds()} your hashrate = ${counter/(end-begin).seconds()}')
	}
	
}