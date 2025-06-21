#!/bin/bash

# Automated Frappe/ERPNext Development Setup
# This script runs when the devcontainer starts

set -e

echo "🚀 Setting up Frappe/ERPNext development environment..."

# Check if bench is already initialized
if [ ! -d "/home/frappe/frappe-bench" ]; then
    echo "📦 Initializing Frappe bench..."
    bench init \
        --frappe-branch=version-15 \
        --frappe-path=https://github.com/frappe/frappe \
        --no-procfile \
        --no-backups \
        --skip-redis-config-generation \
        /home/frappe/frappe-bench
    
    cd /home/frappe/frappe-bench
    
    # Create common site config
    echo "{}" > sites/common_site_config.json
    
    # Create apps.txt with required apps
    echo -e "frappe\nerpnext" > sites/apps.txt
    
    echo "✅ Frappe bench initialized"
else
    echo "✅ Frappe bench already exists"
    cd /home/frappe/frappe-bench
fi

# Check if site exists
if [ ! -d "sites/onestone.localhost" ]; then
    echo "🌐 Creating onestone.localhost site..."
    bench new-site onestone.localhost \
        --db-host=db \
        --no-mariadb-socket \
        --db-root-password=admin \
        --admin-password=admin \
        --install-app erpnext
    
    echo "✅ Site created and ERPNext installed"
else
    echo "✅ Site already exists"
fi

# Install custom app if not already installed
if ! bench --site onestone.localhost list-apps | grep -q "onestone"; then
    echo "📱 Installing onestone custom app..."
    
    # Add onestone to apps.txt
    echo "onestone" >> sites/apps.txt
    
    # Install the app
    bench --site onestone.localhost install-app onestone
    
    # Run custom field creation script
    bench --site onestone.localhost execute onestone.add_customer_fields.create_custom_fields
    
    echo "✅ Custom app installed"
else
    echo "✅ Custom app already installed"
fi

# Build assets
echo "🔨 Building assets..."
bench build

echo "🎉 Setup complete! Your ERPNext site is ready at http://localhost:8000"
echo "📝 Login credentials:"
echo "   Username: Administrator"
echo "   Password: admin" 