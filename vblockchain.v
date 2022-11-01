module main

import core { Blockchain, Transaction }
import vblockio
import caffe
import vweb
import json

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

['/submit_transaction'; post]
pub fn (mut app Vblockchain) submit_transaction() vweb.Result {
        println(app.req.data)
        transaction := json.decode(Transaction, app.req.data) or {
                app.set_status(400, '')
                return app.text('Invalid transaction data, error: ${err}')
        }
        lock app.blockchain {
                app.blockchain.add_new_transaction(transaction)
                return app.text('ok')
        }
        return app.text('error')
}

['/submit_work/:nonce']
pub fn (mut app Vblockchain) submit_work(nonce int) vweb.Result {
        lock app.blockchain {
                println(app.blockchain)
                return app.text(app.blockchain.validate_none(nonce))
        }
        return app.text('error')
}

fn main() {
        mut app := Vblockchain{}
        println(app.init())
        
        // turn on when you want to run the server
        vweb.run(&app, port)
}