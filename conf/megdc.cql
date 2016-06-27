//cqlsh 103.56.92.24 -f $MEGAM_HOME/megdcui/megdc.cql

CREATE KEYSPACE IF NOT EXISTS megdc
     WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 }
    AND DURABLE_WRITES = false;

use megdc;

CREATE TABLE accounts(id text,first_name text,last_name text,phone text,email text,api_key text,password text,authority text,password_reset_key text,password_reset_sent_at text,status text,created_at text,PRIMARY KEY (email));

CREATE TABLE licensing(id text, account_id text, type text,key text,created_at text,expiry_date text,PRIMARY KEY (account_id));

CREATE TABLE Plans(id text, account_id text, plan_name text, created_at text,PRIMARY KEY(account_id, id));

CREATE TABLE  masters(id text,account_id text, ipaddress text,username text,password text,sshkey text,created_at text,inputs list<text>,vertice text,one text,PRIMARY KEY ( account_id, id));

CREATE TABLE vnet(id text, account_id text,name text,bridge text,network_addr text,network_mask text,dns text,gateway text,addrs list<text>,inputs list<text>,PRIMARY KEY(account_id ,name));

CREATE TABLE host(id text,account_id text,region text,vnets list<text>,status text,ipaddress text,inputs list<text>,created_at text,updated_at text,PRIMARY KEY(account_id, id,ipaddress ));

CREATE TABLE billing(id text,account_id text,amount text,gateway text,input list<text>,created_at text,PRIMARY KEY (account_id));

CREATE TABLE regions(id text,account_id text,name text,flag text,currency text,cpu_cost_per_hour text,ram_cost_per_hour text,storage_cost_per_hour text,max_cpu text,max_ram text,max_storage text,flavors list<text>,inputs list<text>,created_at <text>,PRIMARY KEY(account_id,name));
