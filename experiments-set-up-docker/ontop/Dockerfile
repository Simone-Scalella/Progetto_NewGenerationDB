FROM jboss/wildfly:19.1.0.Final

ENV JBOSS_HOME=/opt/jboss/wildfly
ENV TEIID_VERSION=16.0.0 

USER root
RUN yum -y install gettext

USER jboss
RUN cd $JBOSS_HOME \
    && mkdir standalone/data \
    && curl -O https://repo1.maven.org/maven2/org/teiid/wildfly/teiid-wildfly/$TEIID_VERSION/teiid-wildfly-$TEIID_VERSION-dist.zip \
    && bsdtar -xf teiid-wildfly-$TEIID_VERSION-dist.zip \
    && chmod +x bin/*.sh \
    && rm teiid-wildfly-$TEIID_VERSION-dist.zip 

VOLUME ["$JBOSS_HOME/standalone", "$JBOSS_HOME/domain"]

EXPOSE 8080 9990 31000 35432 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
