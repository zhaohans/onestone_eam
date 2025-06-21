# Frappe/ERPNext Development Environment

This VSCode devcontainer provides a fully automated, upgrade-safe development environment for Frappe/ERPNext development.

## Quick Start

1. **Open in VSCode**: Open this folder in VSCode
2. **Reopen in Container**: When prompted, click "Reopen in Container"
3. **Wait for Setup**: The container will automatically:
   - Install all dependencies
   - Set up the Frappe bench environment
   - Start the development server
4. **Access Your Site**: Open http://localhost:8000 in your browser

## Features

- **Automated Setup**: No manual intervention required
- **Upgrade-Safe**: Uses only supported Frappe/ERPNext methods
- **Full Development Environment**: Python, Node.js, MariaDB, Redis
- **Hot Reload**: Changes to your custom app are automatically detected
- **Debugging Support**: Full Python debugging capabilities

## Development Workflow

1. **Custom App Development**: Your `apps/onestone` folder is automatically mounted
2. **Database Access**: MariaDB is available for development
3. **Asset Building**: Run `bench build` to rebuild assets
4. **App Installation**: Use `bench install-app onestone` to install your custom app

## Ports

- **8000**: Frappe Bench (main application)
- **9000**: Socket.IO (real-time features)

## Commands

- `bench start`: Start the development server
- `bench build`: Build assets
- `bench install-app onestone`: Install your custom app
- `bench --site onestone.localhost execute onestone.add_customer_fields.create_custom_fields`: Run custom scripts

This setup is fully compliant with Frappe/ERPNext best practices and requires no manual configuration. 