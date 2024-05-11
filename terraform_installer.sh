#!/bin/bash
# Install terraform x64 bins
# Set up for alpine docker containers


wget https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip
unzip terraform_1.8.3_linux_amd64.zip
mv terraform /usr/local/bin/
chmod +x /usr/local/bin/terraform
rm -r LICENSE.txt
rm -r terraform_1.8.3_linux_amd64.zip
terraform --version