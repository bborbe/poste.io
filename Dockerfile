ARG VENDOR_VERSION
FROM docker.io/analogic/poste.io:${VENDOR_VERSION}
RUN touch /etc/services.d/clamd/down
#RUN sed -i'' 's/^virus\/clamdscan/#virus\/clamdscan/' /etc/qpsmtpd/plugins
RUN echo 'protocols = $protocols' > /usr/share/dovecot/protocols.d/pop3d.protocol
