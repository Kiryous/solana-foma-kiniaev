countfilename="./config/count.txt"

if [ -f $countfilename ]; then
  saved=$(head -n 1 $countfilename)
  current="${saved:-0}"
else
  current=0 
fi

keyfilename="./keys/id-$current.json"

solana-keygen new --no-bip39-passphrase --outfile $keyfilename
private=$(head -n 1 $keyfilename)
pubkey=$(solana-keygen pubkey $keyfilename)
echo $current >| $countfilename
echo "$current | $pubkey" >> keys/pubkeys.txt
echo $private >| ./keys/id-$current-$pubkey.json
rm $keyfilename

finalkeyfilename="./keys/id-$current-$pubkey.json"

solana -k $finalkeyfilename airdrop 3

next=$((current+1))
echo $next >| $countfilename
