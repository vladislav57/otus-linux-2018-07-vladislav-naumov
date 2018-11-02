#!/bin/bash

mdadm --stop /dev/md/all

mdadm --stop /dev/md/two

mdadm --stop /dev/md/one

