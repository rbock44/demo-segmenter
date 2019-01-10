#assume docker invocing user has id 1000:1000
#lets avoid creating host folder .sbt and ivy2 directorys with root:root
groupadd -g 1000 user
useradd --no-log-init -r -u 1000 -g 1000 user -d /root
su user -c "sbt assembly"
