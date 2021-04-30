FROM ubuntu:18.04

ENV ETL_PATH /root/etlegacy

ENV Serverpasswort=123

RUN apt-get update -y && apt-get install -y wget 
RUN apt-get install -y nano g++-multilib lib32stdc++-7-dev lib32z1-dev libc6-dev-i386
RUN apt-get install -y lua5.3 liblua5.3-dev libmariadb-dev lua-sql-mysql default-libmysqlclient-dev gcc gcc+ make openssl liblua5.1-dev lua-any lua-sec unzip zip libssl-dev git luarocks 
RUN luarocks install luasql-mysql MYSQL_INCDIR=/usr/include/mysql
RUN wget -O etlegacy-v2.77.1-316-g7308381-i386.tar.gz https://www.etlegacy.com/workflow-files/dl/7308381d00d9ed80d339435d04b199225ccff66a/lnx32/etlegacy-v2.77.1-316-g7308381-i386.tar.gz \
&& tar -xzf etlegacy-v2.77.1-316-g7308381-i386.tar.gz && rm -f etlegacy-v2.77.1-316-g7308381-i386.tar.gz \
&& mv etlegacy-v2.77.1-316-g7308381-i386 $ETL_PATH

#ENV PAK_MIRROR www.harryhomers.org/et/download/etmain/

WORKDIR $ETL_PATH/etmain
#RUN wget http://$PAK_MIRROR/pak0.pk3 \
#&& wget http://$PAK_MIRROR/pak1.pk3 \
#&& wget http://$PAK_MIRROR/pak2.pk3 \
#&& wget http://$PAK_MIRROR/mp_bin.pk3 \
#&& wget http://$PAK_MIRROR/supplydepot2.pk3 \
#&& wget http://$PAK_MIRROR/sw_goldrush_te.pk3 \
#&& wget http://$PAK_MIRROR/rocketrace_final2.pk3 \
#&& wget http://$PAK_MIRROR/baserace_3.pk3


#COPY etl_server.cfg /root/etlegacy/etmain/

EXPOSE 27960/udp

WORKDIR $ETL_PATH
ENTRYPOINT ./etlded_bot.sh
