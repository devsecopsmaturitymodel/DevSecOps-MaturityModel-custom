FROM wurstbrot/dsomm-yaml-generation as yaml
COPY data/custom /var/www/html/src/assets/YAML/custom
RUN ls /var/www/html/src/assets/YAML/ && cd /var/www/html && php yaml-generation/generateDimensions.php

FROM wurstbrot/dsomm
COPY --from=yaml ["/var/www/html/src/assets/YAML/generated/generated.yaml", "/usr/share/nginx/html/assets/YAML/generated/generated.yaml"]
COPY data/meta.yaml /usr/share/nginx/html/assets/YAML/meta.yaml
