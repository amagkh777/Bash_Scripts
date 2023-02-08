#!/usr/bin/env bash

RSA_KEYS=".ssh/id_rsa"
USER="knife"
HOST="$1"

JBOSS_HOME="/opt"
JBOSS_WORK_DIR="jboss"
JBOSS_DEPLOY_DIR_NAME="jboss-eap-6.3"
JBOSS_DEPLOY_ARCH_NAME="$JBOSS_DEPLOY_DIR_NAME.zip"

me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

echo -e "n[$me] JBoss destroy started.n"

echo -e "Root directory: $JBOSS_HOME"
echo -e "JBoss home: $JBOSS_WORK_DIR"
echo -e "JBoss temp dir: $JBOSS_DEPLOY_DIR_NAME"
echo -e "JBoss deploy archive: $JBOSS_DEPLOY_ARCH_NAMEn"

if [ -z "$HOST" ]; then
	echo -e "ERROR: HOST must be defined with first argument! Exit.n"
	exit 1
fi

if [ -e "$RSA_KEYS" ]; then
	chmod 600 "$RSA_KEYS"
else
	echo -e "ERROR: No private RSA key found! Exit.n"
	exit 1
fi

echo -e "Worknig on $HOST under user $USER.n"

rm_work_dir () {
	ssh -t -t -oStrictHostKeyChecking=no -i "$RSA_KEYS" "$USER@$HOST" "bash -c '
		if [ -d "$JBOSS_HOME/$JBOSS_WORK_DIR" ]; then
			echo -e "Removing $JBOSS_HOME/$JBOSS_WORK_DIR:"
			sudo rm -rfv "$JBOSS_HOME/$JBOSS_WORK_DIR"
		else
			echo -e "$JBOSS_HOME/$JBOSS_WORK_DIR not found, skipping..."
		fi
	'"
}

rm_deploy_dir () {
	ssh -t -t -oStrictHostKeyChecking=no -i "$RSA_KEYS" "$USER@$HOST" "bash -c '
		if [ -d "$JBOSS_HOME/$JBOSS_DEPLOY_DIR_NAME" ]; then
			echo -e "Removing $JBOSS_HOME/$JBOSS_DEPLOY_DIR_NAME:"
			sudo rm -rfv "$JBOSS_HOME/$JBOSS_DEPLOY_DIR_NAME"
		else
			echo -e "$JBOSS_HOME/$JBOSS_DEPLOY_DIR_NAME not found, skipping..."
		fi
	'"
}

rm_deploy_arch () {
	ssh -t -t -oStrictHostKeyChecking=no -i "$RSA_KEYS" "$USER@$HOST" "bash -c '
		if [ -e "$JBOSS_HOME/$JBOSS_DEPLOY_ARCH_NAME" ]; then
			echo -e "Removing $JBOSS_HOME/$JBOSS_DEPLOY_ARCH_NAME:"
			sudo rm -fv "$JBOSS_HOME/$JBOSS_DEPLOY_ARCH_NAME"
		else
			echo -e "$JBOSS_HOME/$JBOSS_DEPLOY_ARCH_NAME not found, skipping..."
		fi
	'"
}

if rm_work_dir; then
	echo -e "n[$me] Work dir cleaned.n"
fi

if rm_deploy_dir; then
	echo -e "n[$me] Deploy directory cleaned.n"
fi

if rm_deploy_arch; then
	echo -e "n[$me] Deploy archive cleaned."
fi

echo -e "n[$me] JBoss destroy completed successfully.n"
exit 0
