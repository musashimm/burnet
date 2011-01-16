echo "============= Custom config start ==========================="

echo "============= Copying additional files to root file system =="

CURR_DIR=`pwd`
cd myboard/target_files
rsync -av * $1
cd $CURR_DIR

echo "==============Custom config end ============================="
