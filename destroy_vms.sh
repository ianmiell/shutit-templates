#!/bin/bash
VBoxManage list runningvms | grep {{ skeleton.module_name }} | awk '{print $1}' | xargs --no-run-if-empty -IXXX VBoxManage controlvm 'XXX' poweroff && VBoxManage list vms | awk '{print $1}'  | xargs --no-run-if-empty -IXXX VBoxManage unregistervm 'XXX' --delete
