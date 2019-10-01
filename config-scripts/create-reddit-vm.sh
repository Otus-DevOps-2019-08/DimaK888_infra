#!/bin/bash

gcloud compute instances create reddit-full-app\
    --boot-disk-size=10GB \
    --image-family reddit-full \
    --machine-type=f1-micro \
    --tags default-puma-server \
    --restart-on-failure
