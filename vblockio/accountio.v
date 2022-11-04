module vblockio
import os
import json
import core {Account}

pub fn load_accounts() ?[]Account{
	account_file_name := 'data/accounts.json'
	if os.exists(account_file_name) {
		// read file
		file := os.read_file(account_file_name) or { panic(err) }
		// parse json
		accounts := json.decode([]Account, file) or { panic(err) }
		// print accounts
		return accounts
	}
	return none
}

pub fn load_account_by_public_key(public_key string) ?Account {
	accounts := load_accounts()?
	for account in accounts {
		if account.public_key == public_key {
			return account
		}
	}
	return none
}

pub fn save_account(account Account) {
	account_file_name := 'data/accounts.json'

	// check account exists
	// check_account_exists := load_account_by_public_key(account.public_key) or { none }
	// if check_account_exists != none {
	// 	return
	// }

	if !os.exists('data') {
		os.mkdir('data') or { panic(err) }
	}
	if os.exists(account_file_name) {
		// read file
		file := os.read_file(account_file_name) or { panic(err) }
		// parse json
		mut accounts := json.decode([]Account, file) or { panic(err) }
		// append new account
		accounts << account
		// encode json
		json := json.encode(accounts)
		// write file
		os.write_file(account_file_name, json) or { panic(err) }
	} else {
		// create file
		os.create(account_file_name) or { panic(err) }
		// encode json
		json := json.encode([account])
		// write file
		os.write_file(account_file_name, json) or { panic(err) }
	}
}