#!/bin/bash

mdadm /dev/md/one --remove /dev/sdb

mdadm /dev/md/one --add-spare /dev/sde

