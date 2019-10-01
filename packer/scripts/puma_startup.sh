#!/bin/bash

cp ${HOME}/puma.service /etc/systemd/system/puma.service

systemctl daemon-reload
systemctl enable puma.service

