module main
import core {Block,Blockchain,Transaction}
import time
import vblockio

fn main() {
	mut blockchain := if vblockio.have_data() { vblockio.load_blockchain() } else {   core.init_caffe_blockchain() }
	
	max_value:= 1_000_000_000
	println('Welcome to CaffeBlockchain miner started with $blockchain.chain.last().index  blocks')
	
	for block in blockchain.chain.last().index+1..100 {
		println('Mining block $block')
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
			
			if blockchain.validate_block(next_block) {				
				next_block.hash=next_block.hash()
				next_block.merkle_root_hash = next_block.merkle_root_hash()
				println(next_block)
				blockchain.chain<<next_block
				vblockio.save_block(next_block)
				break
			}
		}
		end := time.now()
		println('Time taken for block $block is ${(end-begin).seconds()} your hashrate = ${counter/(end-begin).seconds()}')
	}
	
}