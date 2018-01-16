DATA_DIR=/tmp/mod-lv2-data

git clone --depth 1 https://github.com/BlokasLabs/mod-lv2-data ${DATA_DIR}

for i in `comm -12 <(ls ${DATA_DIR}/plugins-fixed | grep -v bad) <(ls ${LV2_ABS_DIR})`; do
	echo Copying $i data...;
	cp -r ${DATA_DIR}/plugins-fixed/$i ${LV2_ABS_DIR}/
done

rm -rf ${DATA_DIR}

