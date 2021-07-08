FROM wurstbrot/dsomm:latest

COPY data/custom/ /var/www/html/data/custom
RUN ENFORCE_DATA_GENERATION_DURING_RUNTIME=true php data/generateDimensions.php
COPY selectedData.csv /var/www/html/selectedData.csv
RUN chmod 555 /var/www/html/selectedData.csv
COPY evidence-images /var/www/html/assets/evidence-images

