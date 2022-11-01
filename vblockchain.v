module main

import core { Blockchain, Transaction }
import vblockio
import caffe
import vweb

const (
        port = 8888
)

pub struct Vblockchain {
        vweb.Context
        pub mut: blockchain shared Blockchain
}

pub fn (mut app Vblockchain) init() string {
        lock app.blockchain {
                if vblockio.have_data() {
                        app.blockchain = vblockio.load_blockchain()
                        return 'V Blockchain loaded'
                } else {
                        app.blockchain = caffe.init_caffe_blockchain()
                        return 'V Blockchain initialized'
                }
        }
}

pub fn (mut app Vblockchain) index() vweb.Result {
        return app.text('Hello world from Caffe a Blockchain implement in V')
}

['/block/:id']
pub fn (mut app Vblockchain) block(id int) vweb.Result {
        lock app.blockchain {
                return app.json(app.blockchain.chain[id])
        }
        return app.text('error')
}

['/block']
pub fn (mut app Vblockchain) total_block() vweb.Result {
        lock app.blockchain {
                return app.json(app.blockchain.chain)
        }
        return app.text('error')
}

['/current_transactions']
pub fn (mut app Vblockchain) current_transactions() vweb.Result {
        lock app.blockchain {
                return app.json(app.blockchain.current_transactions)
        }
        return app.text('error')
}

['/submit_transaction']
pub fn (mut app Vblockchain) submit_transaction() vweb.Result {
        example_transaction := Transaction{
		hash: '0x123',
		sender: '0x456',
		recipient: '0x789',
		amount: 100,
		timestamp: 1234567890
	}
        lock app.blockchain {
                app.blockchain.add_new_transaction(example_transaction)
                return app.text('ok')
        }
        return app.text('error')
}

fn main() {
        mut app := Vblockchain{}
        println(app.init())
        
        // turn on when you want to run the server
        vweb.run(&app, port)
}