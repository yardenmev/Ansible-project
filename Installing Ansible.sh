#bin/bash
sudo apt update -y 
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
# python3 -m pip install --user ansible
sudo apt install ansible -y 

mkdir ~/ansible
touch ~/ansible/ansible.cfg
echo "ANSIBLE_CONFIGE=~/ansible/ansible.cfg" >> ~/.bashrc 
source ~/.bashrc

echo "-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAyTOvcH30IbfMgpUT7DUCsuOTc1K+FYYxO2TghRoYOWES5qnQ
JHQqHbX/yfGRcxvpGB9KHZhX68PUJnArgPNyw4KaJ3/4WTc8+xdUakGUXSYbtT+k
kc6FvdXPR0I2WyBuj/YNvXtxMMgItv7RGf2fUhGkIT8H2gWQIULz8lqz/00m/Fcz
6a6Fa7+yUSvAMe/60a9PgJwyxNH3lLl1buNsH++2prFUHgV2UUs97HxH86KzDQCH
tOuMhpVsqo7W7U+O3C8xi02fIke6Ue5pR5cnw7HzbKfeTh4+35sQkRibqjHqLdpz
hr22ck4pAsxbG84OMpmOkj0KtwaxLKTriQ4pWQIDAQABAoIBABjGeoX5nIRCY7Z4
sPlXFbv9dfyvZaS0338WzubU7cKzB2bL5kt22nDKJnMxgd2QxEUqJTA7wCfR91+8
VD8Ou0UD4gOXKHej66hnmQd0h9ZoiOTqr1MdAS79EwcNSjAycCrd+5cniiqdlyUh
f5IZvvKWJYXKgyb/pF3UJsHjFWMMXwjDwOSeZmO2oCmJtVrAe6aZpZ4ttD2hA3O4
BxzBGvMPEsKLDN3sO1XMIh46knjD9yiaHESAc6vGvK3Nfq+2WBHleIqipreXp2cy
gDypULEZm20ncuF9cUBmsylxQISkoauYsCiOhU8ub4JXX018eeeaAnheZRNPX8E2
qmetPmECgYEA8u+SxR4PV03EOtUJcWpophchR2ERSnYd3qwnDG6IeWP1YEZA0ydG
k1SE//ptSc2V5KTciaw/LByyB8cKHbFk/vvgQ7rDhm7wPU6u5Fqm4ucMtvP6lak/
uvN4UKGnlz+9AsdPERHF4xXFBEC3h+ZGrEKrHrCfPQ6fkwx1rGMCaAUCgYEA1AWS
s/BAfQn3B5AfjSGP4hzqp4CSQPYIACRKPzrYMp44tZ6fF0wbiinmicArRFbzv3qw
jvxn2cbCMq/OLV0AdRhH/+SdFkgr7v8AF6L53qOZWvbXSHzDBSofdufg3y1Soj0K
SDb1/W9S0BkZh//syWnPynf0CuQ3kE7NnfzhoEUCgYEA2dcoRie5W/D5CERmLlRb
uKu/BLGu/pVCHZ1DeqtXJ3sR2h3FHVL3vz8n8B4QiACY66lFtRJGp3inz7+Ue6HJ
zbfwlutPTyoFtQPsYgpD4e2LgjbvOerFog+WkL8Ud9UI2Qf+B3FngETSIQkjSfKc
5vT1WxTIBckqIIMotccmrj0CgYBwv4HzJEj29WyjXfYZVAayxJPYfVvJJcy9Xo8J
Lt63lEIt+us5NWTTxVJuYH3huqemZLUtZHZJbhPpZmoq33EV09K99rG+nqSWVI6V
AzsDNVag8/EqAAapYWwYDFkd9XkjA3jLTEbl/eQ4+5ADLYqa1SUF02I4xIHzwKRB
ZrAJTQKBgQCF31t2veqFU3yHt+NgO2zfkCsQVYQ16hw6u9QKk+gF3za9AYnhH9RN
JkEqOupGDlvoCdwToZEJODEpBpEkggw8cTaGXdBngUIOd9L78tI95DtKXTIa5hRY
9gk8OPLLCSXkH8jOjJdhbyc0PJ477GOvgvhzuqMbjmc+C45rdBYGbQ==
-----END RSA PRIVATE KEY-----" >> key.pem

chmod 0600 key.pem