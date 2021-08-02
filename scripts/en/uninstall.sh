#!/bin/bash

uninstall()
{
	cd $installdir
	docker-compose stop
	docker-compose rm phala-node phala-pruntime phala-pherry
	docker image rm phala-dev-node phala-dev-pruntime phala-dev-pherry # 合并到main时，更新image名字
	remove_dirver
	local node_data=$(awk -F '[=:]' 'NR==4 {print $2}' $installdir/.env)
	local pruntime_data=$(awk -F '[=:]' 'NR==5 {print $2}' $installdir/.env)
	rm -rf $installdir $node_data $pruntime_data
	rm /usr/bin/phala

	log_success "---------------Uninstall phala node sucess---------------"
}
