FROM grafana/grafana:latest
COPY ./config.ini /etc/grafana/config.ini
ADD ./provisioning /etc/grafana/provisioning
ADD ./dashboards /var/lib/grafana/dashboards
RUN grafana-cli plugins install grafana-piechart-panel