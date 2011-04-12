echo "============= Custom config start ==========================="

echo "============= Copying additional files to root file system =="

rsync -av target/device/Propox/MMNet1002/custom_target_files/* $1

echo "==============Custom config end ============================="
