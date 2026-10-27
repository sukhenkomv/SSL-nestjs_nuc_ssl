
rm ./nuc-root.pem

for f in Russian_Trusted_Sub_CA_2024 Russian_Trusted_Sub_CA Russian_Trusted_Root_CA
do
    cat ./$f.cer >> ./nuc-root.pem
done
