module io
import core {Block,Transaction}
import os
import json
pub fn save_block(block Block) {
	if !os.exists('data') {
		os.mkdir('data') or { panic(err) }
	}
	 os.write_file('data/block_${block.index}.txt', json.encode(block)) or {
		panic(err)
	 }
	
}
pub fn load_block(index int) Block {
	
	if os.exists('data/block_${index}.txt') {
		content := os.read_file('block_${index}.txt') or {
			panic(err)
		}
		block := json.decode(Block, content) or {
			panic(err)
		}
		return block
	}
	panic('block_${index}.txt not found')
	
	
}
