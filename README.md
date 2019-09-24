# On host machine side:
You need to create folders and add SELinux permissions
```bash
mkdir -p /mnt/local-storage/sdb1
mkdir -p /mnt/local-storage/sdc1
chcon -R unconfined_u:object_r:svirt_sandbox_file_t:s0 /mnt/local-storage/
```

# Project create
To create new project with local-provisioner app, please do:
`./install.sh` 

# Project delete
Here is bash script to delete existing resources and project in openshift
`./delete.sh`
