# rdma over ethernet

## requirements

* ubuntu xenial 

tested with Ubuntu Xenial, should work with any linux distribution with minor changes

## instances setup

* create 2 Ubuntu Xenial AWS instances 
* the security group should allow for UDP and TCP communication between the instances
* upload ``configure.sh`` and ``rdma_user_rxe.h`` to ~ubuntu
* run ``./configure.sh``
* reboot
* run ``rxe_cfg add eth0``
* run ``rxe_cfg start``

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

* load rxe at boot

