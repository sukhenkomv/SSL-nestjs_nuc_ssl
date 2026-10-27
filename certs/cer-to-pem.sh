
for f in Russian_Trusted_Root_CA Russian_Trusted_Sub_CA_2024 Russian_Trusted_Sub_CA
do
    openssl x509 -inform DER -in ./$f.cer -out ./$f.pem
done


