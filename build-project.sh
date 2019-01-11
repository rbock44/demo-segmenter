#lets avoid creating host folder .sbt and ivy2 directorys with root:root
groupadd -g $HOSTUID usergroup
useradd --no-log-init -r -u $HOSTUID -g usergroup hostuser -d /root
su hostuser -c "sbt assembly"
