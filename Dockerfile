FROM perl:5.30-buster
RUN apt update && apt install -y pkg-config libglib2.0-dev xml2 libpango1.0-dev libcairo2-dev gettext
RUN apt install -y groff
RUN mkdir -p /var/lib/growthforecast
RUN cpanm -n --no-man-pages -v GrowthForecast
RUN rm -rf /root/.cpanm/work/*
EXPOSE 5125
CMD growthforecast.pl --data-dir /var/lib/growthforecast
