#!/bin/bash

mdadm --zero-superblock --force /dev/sd[b-g]

mdadm --create --verbose --force /dev/md/one --level=raid1 --raid-devices=2 /dev/sdb /dev/sdc --spare-devices=1 /dev/sdd --size=200M

mdadm --create --verbose --force /dev/md/two --level=raid1 --raid-devices=2 /dev/sdf /dev/sdg

mdadm --create --verbose --force /dev/md/all --level=raid0 --raid-devices=2 /dev/md/one /dev/md/two

