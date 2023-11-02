FROM jboss/keycloak:12.0.1

ENV JBOSS_HOME /opt/jboss/keycloak
ENV THEMES_HOME $JBOSS_HOME/themes/base

COPY build/resources/main/theme/base/admin/resources/partials $THEMES_HOME/admin/resources/partials
COPY build/resources/main/theme/base/admin/messages $THEMES_HOME/admin/messages
COPY build/resources/main/theme/base/login/messages $THEMES_HOME/login/messages
RUN cat /opt/jboss/keycloak/themes/base/admin/messages/admin-messages_en.custom >> /opt/jboss/keycloak/themes/base/admin/messages/admin-messages_en.properties
RUN cat /opt/jboss/keycloak/themes/base/admin/messages/admin-messages_ru.custom >> /opt/jboss/keycloak/themes/base/admin/messages/admin-messages_ru.properties
RUN cat /opt/jboss/keycloak/themes/base/login/messages/messages_en.custom >> /opt/jboss/keycloak/themes/base/login/messages/messages_en.properties
RUN cat /opt/jboss/keycloak/themes/base/login/messages/messages_ru.custom >> /opt/jboss/keycloak/themes/base/login/messages/messages_ru.properties
COPY "build/libs/keycloak-russian-providers-1.0.26.jar" $JBOSS_HOME/standalone/deployments/keycloak-russian-providers.jar
EXPOSE 9990
CMD [ "-Djboss.bind.address=0.0.0.0", "-Djboss.bind.address.management=0.0.0.0"]
