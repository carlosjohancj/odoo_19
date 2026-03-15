FROM odoo:19.0

USER root

# Listar archivos para depuración (esto saldrá en el log de Dokploy si falla)
RUN ls -R /

# Copiamos la carpeta de módulos (esta parece que sí la encuentra bien)
COPY ./addons /mnt/extra-addons

# COPIA DEL CONFIG: 
# Si tu archivo está en la raíz, deja esta línea:
COPY ./config/odoo.conf /etc/odoo/odoo.conf

# Si tu archivo está dentro de una carpeta llamada 'config', usa esta:
# COPY ./config/odoo.conf /etc/odoo/odoo.conf

RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo/odoo.conf

USER odoo

# Forzamos a Odoo a leer el archivo y las variables de entorno
ENTRYPOINT ["odoo"]
CMD ["-c", "/etc/odoo/odoo.conf"]