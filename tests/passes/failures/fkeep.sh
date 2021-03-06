#!/bin/bash

for failTest in $(find ../../fails -maxdepth 1 -mindepth 1 -type d | sort); do
	dir=$(basename $failTest)

	if [[ ! -d $dir ]]; then
		echo "New test: $dir"
		mkdir $dir
		echo '#!/bin/bash' > $dir/fkeep.sh
		echo "pushd ../../../fails/$dir > /dev/null" >> $dir/fkeep.sh
		echo "  fkeep -d" >> $dir/fkeep.sh
		echo "popd > /dev/null" >> $dir/fkeep.sh
		chmod a+x $dir/fkeep.sh
	else
		echo "Existing test: $dir"
	fi
done
