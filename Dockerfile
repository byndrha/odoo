FROM odoo:19

USER root

# Install dependencies tambahan jika diperlukan
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Copy custom addons jika ada
COPY ./addons /mnt/extra-addons

# Copy konfigurasi
COPY ./odoo.conf /etc/odoo/odoo.conf

# Set permissions
RUN chown -R odoo:odoo /mnt/extra-addons

USER odoo

EXPOSE 8069 8072