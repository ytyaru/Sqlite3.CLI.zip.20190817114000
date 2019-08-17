SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

echo -e "aaa\nAAA" > A.txt
echo -e "bbb\nBBB" > B.txt
mkdir -p ./D/DD
echo -e "ddd\nDDD" > ./D/DD/DDD.txt
zip -r myarchive A.txt B.txt D/
ls -1 | grep myarchive.zip

sqlite3 myarchive.zip -zip ".tables"
sqlite3 myarchive.zip -zip ".headers on" "select * from zip";

