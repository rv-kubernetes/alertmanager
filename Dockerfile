FROM quay.io/prometheus/alertmanager

COPY       alertmanager.yml /etc/alertmanager/alertmanager.yml
COPY       argocd-email.tmpl /etc/alertmanager/template/argocd-email.tmpl
USER       nobody
EXPOSE     9093
VOLUME     [ "/alertmanager" ]
WORKDIR    /alertmanager
ENTRYPOINT [ "/bin/alertmanager" ]
CMD        [ "--config.file=/etc/alertmanager/alertmanager.yml", \
             "--storage.path=/alertmanager" ]