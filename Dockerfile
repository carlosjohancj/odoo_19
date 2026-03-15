# Usa la imagen oficial de Odoo 19 como base
FROM odoo:19.0

# Cambiar a root para instalar dependencias o copiar archivos
USER root

# Copiar tus módulos personalizados a la carpeta de addons extra
COPY ./addons /mnt/extra-addons

# Asegurar permisos (opcional pero recomendado)
RUN chown -R odoo:odoo /mnt/extra-addons

# Volver al usuario odoo
USER odoo

# Exponer puerto (ya lo hace la imagen base, pero por claridad)
EXPOSE 8069