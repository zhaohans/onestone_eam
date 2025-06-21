#!/bin/bash

# One Stone Capital EAM System Deployment Script
# This script installs the onestone_eam app and imports all fixtures

set -e  # Exit on any error

echo "=========================================="
echo "One Stone Capital EAM System Deployment"
echo "=========================================="

# Check if site name is provided
if [ -z "$1" ]; then
    echo "Usage: ./deploy.sh <site-name>"
    echo "Example: ./deploy.sh onestone.localhost"
    exit 1
fi

SITE_NAME=$1

echo "Deploying to site: $SITE_NAME"
echo ""

# Step 1: Install the app
echo "Step 1: Installing onestone_eam app..."
bench --site $SITE_NAME install-app onestone_eam
echo "✓ App installed successfully"
echo ""

# Step 2: Migrate database
echo "Step 2: Running database migrations..."
bench --site $SITE_NAME migrate
echo "✓ Database migrated successfully"
echo ""

# Step 3: Import fixtures in order
echo "Step 3: Importing fixtures..."

echo "  - Importing roles..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/roles.json
echo "  ✓ Roles imported"

echo "  - Importing customer custom fields..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/customer_custom_fields.json
echo "  ✓ Customer custom fields imported"

echo "  - Importing customer permissions..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/customer_permissions.json
echo "  ✓ Customer permissions imported"

echo "  - Importing KYC checklist item..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/kyc_checklist_item.json
echo "  ✓ KYC checklist item imported"

echo "  - Importing KYC workflow..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/kyc_workflow.json
echo "  ✓ KYC workflow imported"

echo "  - Importing AUM Portfolio..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/aum_portfolio.json
echo "  ✓ AUM Portfolio imported"

echo "  - Importing Portfolio Holding..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/portfolio_holding.json
echo "  ✓ Portfolio Holding imported"

echo "  - Importing Trade..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/trade.json
echo "  ✓ Trade imported"

echo "  - Importing Trade server scripts..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/trade_server_scripts.json
echo "  ✓ Trade server scripts imported"

echo "  - Importing Trade client scripts..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/trade_client_scripts.json
echo "  ✓ Trade client scripts imported"

echo "  - Importing Fee Report..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/fee_report.json
echo "  ✓ Fee Report imported"

echo "  - Importing Fee Report server scripts..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/fee_report_server_scripts.json
echo "  ✓ Fee Report server scripts imported"

echo "  - Importing Compliance Task..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/compliance_task.json
echo "  ✓ Compliance Task imported"

echo "  - Importing Client Review..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/client_review.json
echo "  ✓ Client Review imported"

echo "  - Importing Compliance scheduled scripts..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/compliance_scheduled_scripts.json
echo "  ✓ Compliance scheduled scripts imported"

echo "  - Importing Dashboards..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/dashboards.json
echo "  ✓ Dashboards imported"

echo "  - Importing Workspace..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/workspace.json
echo "  ✓ Workspace imported"

echo "  - Importing Reports..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/reports.json
echo "  ✓ Reports imported"

echo "  - Importing Print Formats..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/print_formats.json
echo "  ✓ Print Formats imported"

echo "  - Importing Notifications..."
bench --site $SITE_NAME import-fixtures --file apps/onestone_eam/fixtures/notifications.json
echo "  ✓ Notifications imported"

echo ""
echo "✓ All fixtures imported successfully"
echo ""

# Step 4: Clear cache
echo "Step 4: Clearing cache..."
bench --site $SITE_NAME clear-cache
echo "✓ Cache cleared"
echo ""

# Step 5: Build assets
echo "Step 5: Building assets..."
bench --site $SITE_NAME build
echo "✓ Assets built"
echo ""

# Step 6: Final verification
echo "Step 6: Running system check..."
bench --site $SITE_NAME doctor
echo "✓ System check completed"
echo ""

echo "=========================================="
echo "DEPLOYMENT COMPLETED SUCCESSFULLY!"
echo "=========================================="
echo ""
echo "Next Steps:"
echo "1. Access the system at: http://$SITE_NAME"
echo "2. Assign users to appropriate roles:"
echo "   - Relationship Manager"
echo "   - Compliance Officer"
echo "   - Operations"
echo "   - Management"
echo "   - External User"
echo "3. Test the Wealth Management workspace"
echo "4. Verify KYC workflow functionality"
echo "5. Test trade creation and portfolio updates"
echo "6. Configure email settings for notifications"
echo ""
echo "For detailed documentation, see: apps/onestone_eam/README.md"
echo ""
echo "==========================================" 