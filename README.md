# rdma over ethernet

## requirements

* ubuntu xenial 
* packer (https://www.packer.io/)
* aws cli

tested with Ubuntu Xenial, should work with any linux distribution with minor changes

# image creation (with packer)

### if using IAM roles and/or MFA
```sh
aws sts assume-role --role-arn arn:aws:iam::ACCOUNT-ID:role/ROLE_NAME \
                    --role-session-name "Packer" \
                    --token-code 2FATOKEN \
                    --serial-number arn:aws:iam::ACCOUNT_ID:mfa/USER_NAME > /tmp/session.json

export AWS_ACCESS_KEY_ID=$(cat /tmp/session.json | jq .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(cat /tmp/session.json | jq .Credentials.SecretAccessKey
export AWS_SESSION_TOKEN=$(cat /tmp/session.json | jq .Credentials.SessionToken)
```

```sh
packer build template.json
```

## instances setup
* create 2 AWS instances using previously built image

## test

* all tests: 
    * run server command on one instance and run the client on the other using the server IP as parameter
    * all tested on amazon AWS
    * install: rdmacm-utils and ibutils
    
* ``rdma_server`` and ``rdma_client``: connection OK
* ``udaddy``: fails with segmentation fault, possible bug?
* ``ib_read_lat``: high latency variation (average: 250usec, max: 3600usec)
* ``ib_write_lat``: same as with read latency, with slightly lower results (average: 150usec, max: 2800usec)

## IMPROVEMENTS

* buggy rxe service installation


