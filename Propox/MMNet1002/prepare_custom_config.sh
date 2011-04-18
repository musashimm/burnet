echo "============= Custom config start ==========================="

echo "============== Making symlinks =============================="
ln -s $1/tmp/log $1/dev/log
ln -s $1/proc/mounts $1/etc/mtab
ln -s $1/tmp/random-seed $1/etc/random-seed
ln -s $1/tmp/resolv.conf $1/etc/resolv.conf
ln -s $1/tmp $1/var/cache
ln -s $1/tmp $1/var/lib/pcmcia
ln -s $1/tmp $1/var/lock
ln -s $1/tmp $1/var/log
ln -s $1/tmp $1/var/pcmcia
ln -s $1/tmp $1/var/run
ln -s $1/tmp $1/var/spool
ln -s $1/tmp $1/var/tmp
echo "============= Copying additional files to root file system =="
rsync -av target/device/Propox/MMNet1002/custom_target_files/* $1

echo "==============Custom config end ============================="
