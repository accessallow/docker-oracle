#!/bin/bash

echo "Installing HR Schema..."

sqlplus -s sys/oracle@XEPDB1 as sysdba @/opt/oracle/db-sample-schemas/human_resources/hr_install.sql

echo "Script complete. Unlocking user..."

# Unlock the user and set password just to be sure
sqlplus -s sys/oracle@XEPDB1 as sysdba << EOF
ALTER USER hr ACCOUNT UNLOCK;
ALTER USER hr IDENTIFIED BY hr;
EXIT;
EOF

echo "Installing CO Schema..."

sqlplus -s sys/oracle@XEPDB1 as sysdba @/opt/oracle/db-sample-schemas/customer_orders/co_install.sql

echo "Testing and Unlocking CO user..."
sqlplus -s sys/oracle@XEPDB1 as sysdba << EOF
ALTER USER co ACCOUNT UNLOCK;
ALTER USER co IDENTIFIED BY co;
EXIT;
EOF

echo "Done!"
