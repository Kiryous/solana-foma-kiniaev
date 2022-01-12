countfilename="./config/count.txt"

if [ -f $countfilename ]; then
  saved=$(head -n 1 $countfilename)
  # echo "Latest key count: $saved"
  current="${saved:-0}"
  current=$((current+1))
  # echo "Current key count: $current"
else
  current="1"
fi

keyfilename="./keys/id-$current.json"

solana-keygen new --no-bip39-passphrase --outfile $keyfilename >/dev/null
private=$(head -n 1 $keyfilename)
pubkey=$(solana-keygen pubkey $keyfilename)
echo $current >| $countfilename
echo "$current | $pubkey" >> keys/pubkeys.txt
echo $private >| ./keys/id-$current-$pubkey.json
rm $keyfilename

finalkeyfilename="./keys/id-$current-$pubkey.json"

solana -k $finalkeyfilename airdrop 10 >/dev/null

echo "🛂 Success! Here is our $current wallet with 10 SOL\n"
echo "pubkey:"
echo $pubkey
echo "\nprivate:"
cat $finalkeyfilename
echo "\n"

echo $current >| $countfilename
