export MARATHON_KEY_PASSWORD='password'
export MARATHON_PKCS_PASSWORD='password'
export MARATHON_JKS_PASSWORD='password'

# generate certificate request.
openssl genrsa -des3 -out marathon.key -passout "env:MARATHON_KEY_PASSWORD" 2048
openssl req -new -sha256 -key marathon.key -out marathon.csr

# convert to pem
openssl x509 -in marathon.crt -out trusted.pem -outform PEM

# combine pk and signed cert
openssl pkcs12 -inkey marathon.key \
                 -passin "env:MARATHON_KEY_PASSWORD" \
                   -name marathon \
                     -in trusted.pem \
               -password "env:MARATHON_PKCS_PASSWORD" \
          -chain -CAfile "trustedCA.crt" \
            -export -out marathon.pkcs12

# generate jks
keytool -importkeystore -srckeystore marathon.pkcs12 \
                              -srcalias marathon \
                          -srcstorepass $MARATHON_PKCS_PASSWORD \
                          -srcstoretype PKCS12 \
                          -destkeystore marathon.jks \
                         -deststorepass $MARATHON_JKS_PASSWORD
