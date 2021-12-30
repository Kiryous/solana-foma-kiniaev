
<img src="https://user-images.githubusercontent.com/2504771/147730463-91726995-f48d-4f6d-8a25-953fb4eaf233.png" width="300">

# solana-foma-kiniaev
A small bash script to generate new solana key &amp; airdrop 3 SOL for testing applications with

# Usage
```
bash ./create-new-wallet.sh
```

## Prerequisites
You should install [`solana`](https://docs.solana.com/cli/install-solana-cli-tools) and have solana-test-validator runnning. Run the following if you don't 
```
solana-test-validator --rpc-port 8899
```

## Run
```
bash ./create-new-wallet.sh
```

## You'll get
1. New keypair will be generated without prompting for a BIP39 passphrase.
2. Private key will be saved in file with the name `id-<count>_<public-key>.json`.
3. Public key also will be saved in pubkeys.txt as new line, like the following: `<count> | <public-key>`
4. Count will be incremented and saved in `count.txt`
