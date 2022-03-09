include .env

VARS:=$(shell sed -ne 's/ *\#.*$$//; /./ s/=.*$$// p' .env )
$(foreach v,$(VARS),$(eval $(shell echo export $(v)="$($(v))")))


help:
	@echo "####################################################"
	@echo "##                                                ##"
	@echo "##               Lukso Make Script                ##"
	@echo "##                                                ##"
	@echo "####################################################"
	@echo ""
	@echo "use \"make FLAGNAME\" to do particular task";
	@echo "this makefile supports following FLAGNAMEs";
	@echo "   mnemonic        - Generate a mnemonic";
	@echo "   create-deposit  - create deposit-data.json"
	@echo "   create-wallet   - create wallet"
	@echo "   start           - start all except the validator nodes"
	@echo "   start-validator - start only the validator client"
	@echo "   stop            - stop all nodes"
	@echo "   delete          - delete all data directory"
	@echo "   log_execution        - show execution log"
	@echo "   log_consensus      - show consensus log"
	@echo "   log_validator   - show validator log"


mnemonic:
	@echo "Please copy this mnemonic"; \
	./bin/eth2-val-tools mnemonic;

create-deposit:
	@read -p "Enter number of validators: " NUMBER_OF_VALIDATORS \
	&& read -p "Enter validator mnemonic: " VALIDATOR_MNEMONIC \
	&& read -p "Enter withdrawal mnemonic: " WITHDRAWAL_MNEMONIC \
	&& ./bin/eth2-val-tools deposit-data \
	--fork-version=0x60000069 \
	--source-max=$$NUMBER_OF_VALIDATORS \
	--source-min=0 \
	--validators-mnemonic="$$VALIDATOR_MNEMONIC" --withdrawals-mnemonic="$$WITHDRAWAL_MNEMONIC" \
	| sed 's/}/},/g' | sed '1 s/./[{/' > ./deposit_data.json; echo "]" >> ./deposit_data.json;


create-wallet:
	@read -p "Enter number of validators: " NUMBER_OF_VALIDATORS \
	&& read -p "Enter validator mnemonic: " VALIDATOR_MNEMONIC \
	&& read -p "Enter a valid keystore password: " PASSWORD \
	&& ./bin/eth2-val-tools keystores \
	--insecure \
    --out-loc "./keystore" \
    --prysm-pass "$$PASSWORD" \
    --source-max $$NUMBER_OF_VALIDATORS \
    --source-min 0 \
    --source-mnemonic "$$VALIDATOR_MNEMONIC" \
    && echo "$$PASSWORD" > ./keystore/password.txt;


start:
ifeq ("$(wildcard $(CONFIGS_VOLUME))", "")
	$(error  $(CONFIGS_VOLUME) directory not found)
endif
	docker-compose up -d init-geth geth prysm_beacon eth2stats-client


start-validator:
ifeq ("$(wildcard $(KEYSTORE_VOLUME))", "")
	$(error  $(KEYSTORE_VOLUME) directory not found)
endif

ifeq ("$(wildcard $(CONFIGS_VOLUME))", "")
	$(error  $(CONFIGS_VOLUME) directory not found)
endif
	@echo "Starting geth, beacon and validator"
	docker-compose up -d prysm_validator

stop:
	@echo "Stopping geth, beacon and validator"
	docker-compose down

delete:
	@rm -rf ${EXECUTION_DATA_VOLUME} ${CONSENSUS_DATA_VOLUME} ${VALIDATOR_DATA_VOLUME}

log_geth:
	docker logs -f lukso-geth

log_beacon:
	docker logs -f prysm_beacon

log_validator:
	docker logs -f prysm_validator

restart_stats:
	sudo docker-compose stop eth2stats-client; sudo docker-compose up -d eth2stats-client
