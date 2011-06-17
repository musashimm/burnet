echo "============= Custom config start ==========================="

echo "============== Making symlinks =============================="
ln -s ../tmp/log $1/dev/log
ln -s ../proc/mounts $1/etc/mtab
ln -s ../tmp/random-seed $1/etc/random-seed
ln -s ../tmp/resolv.conf $1/etc/resolv.conf
ln -s ../tmp $1/var/cache
ln -s ../tmp $1/var/lock
ln -s ../tmp $1/var/log
ln -s ../tmp $1/var/run
ln -s ../tmp $1/var/spool
ln -s ../tmp $1/var/tmp
echo "============= Copying additional files to root file system =="
rsync -av target/device/Propox/MMNet1002/custom_target_files/* $1

echo "==============Custom config end ============================="
