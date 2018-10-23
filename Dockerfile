#FROM mule-ee:3.9.1
# Let us install JDK 8
FROM openjdk:8-jdk-alpine

MAINTAINER ananth@capiot.com

#CMD ["/usr/bin/java", "-v"]

RUN mkdir /opt

ADD mule-ee-distribution-standalone-3.9.1.zip /opt 
WORKDIR /opt
RUN jar -xvf mule-ee-distribution-standalone-3.9.1.zip

RUN ln -s mule-enterprise-standalone-3.9.1/mule-enterprise-standalone-3.9.1 mule

# Configure external access for Mule ESB:
# Mule remote debugger
EXPOSE 5000

# Mule JMX port (must match Mule config file)
EXPOSE 1098

# Mule MMC agent port
EXPOSE 7777

# Environment and execution:
ENV MULE_BASE /opt/mule
WORKDIR /opt/mule-enterprise-standalone-3.9.1

# RUN ls -alR .

RUN rm -rf /opt/mule-ee-distribution-standalone-3.9.1.zip
RUN ["chmod", "+x", "/opt/mule-enterprise-standalone-3.9.1/bin/mule"]
CMD /opt/mule/bin/mule