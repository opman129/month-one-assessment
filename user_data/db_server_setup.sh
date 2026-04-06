#!/bin/bash

yum update -y

# Install PostgreSQL
amazon-linux-extras enable postgresql14
yum install -y postgresql-server postgresql

# Initialize DB
postgresql-setup initdb

# Start and enable service
systemctl start postgresql
systemctl enable postgresql

# Basic config (allow local connections)
sed -i "s/ident/md5/g" /var/lib/pgsql/data/pg_hba.conf

systemctl restart postgresql