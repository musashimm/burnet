echo "============= Custom config start ==========================="

CURR_DIR=`pwd`
cd myboard/target_files
rsync -av * $1
cd $CURR_DIR

echo "==============Custom config end ============================="
