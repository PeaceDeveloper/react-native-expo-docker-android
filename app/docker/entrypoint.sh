#!/bin/bash
set -ex

export ENABLE_X=${ENABLE_X:-yes}
export RUN_FLUXBOX=${RUN_FLUXBOX:-yes}
export RUN_NOVNC=${RUN_NOVNC:-yes}
export RUN_APPIUM=${RUN_APPIUM:-no}
export APPIUM_PORT=${APPIUM_PORT:-4723}
export APPIUM_PLUGINS=${APPIUM_PLUGINS:-""}
export EMULATOR_FLAGS=${EMULATOR_FLAGS:-"-no-snapshot -no-audio"}
export ROOT=${ROOT:-no}

case $ROOT in
	true|yes|y|1)
		export EMULATOR_FLAGS="$EMULATOR_FLAGS -writable-system -shell"
		;;
esac

case $ENABLE_X in
	false|no|n|0)
		rm -f ./docker/conf.d/x11vnc.conf
		rm -f ./docker/conf.d/xvfb.conf
		rm -f ./docker/conf.d/fluxbox.conf
		rm -f ./docker/conf.d/websockify.conf
		export EMULATOR_FLAGS="$EMULATOR_FLAGS -no-qt -no-window -no-snapshot -no-audio"
		;;
esac

case $RUN_FLUXBOX in
	false|no|n|0)
		rm -f ./docker/conf.d/fluxbox.conf
		;;
esac

case $RUN_NOVNC in
	false|no|n|0)
		rm -f ./docker/conf.d/websockify.conf
		;;
esac

case $RUN_APPIUM in
	false|no|n|0)
		rm -f ./docker/conf.d/appium.conf
		;;
	*)
		for plugin in ${APPIUM_PLUGINS//,/ }; do
			appium plugin install "$plugin"
		done
		;;
esac

exec supervisord -c ./docker/supervisord.conf