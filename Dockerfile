FROM odoo:19.0

USER root

# Copiamos tus módulos personalizados
COPY ./addons /mnt/extra-addons

# Copiamos el archivo de configuración
COPY ./odoo.conf /etc/odoo/odoo.conf

# Aseguramos permisos para el usuario odoo
RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo/odoo.conf

USER odoo

# Este comando le dice a Odoo explícitamente qué archivo usar
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]