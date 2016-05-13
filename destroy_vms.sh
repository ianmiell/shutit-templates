#!/bin/bash
while true 
do
	VBoxManage list runningvms | grep {{ skeleton.module_name }} | awk '{print $1}' | xargs --no-run-if-empty -IXXX VBoxManage controlvm 'XXX' poweroff && VBoxManage list vms | awk '{print $1}'  | xargs --no-run-if-empty -IXXX VBoxManage unregistervm 'XXX' --delete
	if [[ $(VBoxManage list vms | grep {{ skeleton.module_name }} | wc -l) == '0' ]]
	then
		break
	else
		ps -ef | grep virtualbox | grep {{ skeleton.module_name }} | awk '{print $2}' | xargs kill
		sleep 10
	fi
done

