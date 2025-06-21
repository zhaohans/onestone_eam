# One Stone Capital EAM (External Asset Manager) System

A comprehensive, upgrade-safe ERPNext custom app for One Stone Capital's Wealth/EAM (External Asset Manager) system. All customizations are implemented using only supported extension points, ensuring full compatibility with ERPNext upgrades.

## 🚀 Features

### Core Modules
- **CRM/Client Management**: Enhanced customer profiles with KYC workflow
- **Portfolio Management**: AUM tracking and portfolio holdings
- **Trade Management**: Automated trade processing and settlement
- **Fee & Retrocession**: Management fees and retrocession tracking
- **Compliance**: Task management and client reviews
- **Reporting**: Comprehensive dashboards and reports

### Key Features
- ✅ **Upgrade-Safe**: Zero core ERPNext modifications
- ✅ **Role-Based Access**: Comprehensive permission matrix
- ✅ **Workflow Automation**: KYC onboarding workflow
- ✅ **Real-time Dashboards**: KPIs and analytics
- ✅ **Frappe Cloud Ready**: Fully compatible with Frappe Cloud deployment

## 📋 Requirements

- ERPNext v15+
- Frappe v15+
- Python 3.10+

## 🛠️ Installation

### For Frappe Cloud
1. Connect this repository to your Frappe Cloud account
2. Install via Frappe Cloud Marketplace or direct app installation
3. No additional configuration required

### For Self-Hosted ERPNext
```bash
# Install the app
bench get-app onestone_eam https://github.com/your-username/onestone_eam.git
bench install-app onestone_eam

# Migrate database
bench migrate

# Build assets
bench build
```

## 📁 App Structure

```
apps/onestone_eam/
├── fixtures/                    # All customizations exported as fixtures
│   ├── customer_custom_fields.json
│   ├── aum_portfolio.json
│   ├── trade.json
│   ├── fee_report.json
│   ├── compliance_task.json
│   ├── kyc_workflow.json
│   ├── roles.json
│   ├── dashboards.json
│   ├── reports.json
│   └── notifications.json
├── onestone_eam/               # Python modules
│   ├── crm/                    # Customer management
│   ├── wealth/                 # Portfolio and trade management
│   ├── compliance/             # Compliance tasks and reviews
│   ├── retrocession/           # Fee and retrocession management
│   └── hooks.py               # App hooks and configuration
├── setup.py                   # App setup configuration
├── requirements.txt           # Python dependencies
└── README.md                 # This file
```

## 🔧 Configuration

### Custom Fields Added to Customer DocType
- `osc_kyc_status` - KYC verification status
- `osc_onboarding_status` - Client onboarding workflow state
- `osc_relationship_manager` - Link to User (filtered by RM role)
- `osc_advisor` - Link to User (filtered by Advisor role)
- `osc_client_type` - Individual/Corporate/Trust/Family Office
- `osc_risk_profile` - Low/Medium/High/Ultra High
- `osc_aum_amount` - Total AUM (read-only, auto-calculated)
- `osc_source_of_wealth` - Source of wealth information
- `osc_date_onboarded` - Date client was onboarded
- `osc_compliance_notes` - Compliance-related notes

### Custom DocTypes
- **AUM Portfolio**: Investment portfolios linked to clients
- **Portfolio Holding**: Individual security positions within portfolios
- **Trade**: Transaction records with automated holdings updates
- **Fee Report**: Management fees, performance fees, and retrocession tracking
- **Compliance Task**: General compliance tasks
- **Client Review**: Periodic client reviews

### Roles & Permissions
- **Relationship Manager**: Full access to clients and portfolios
- **Compliance Officer**: Compliance tasks and KYC approval
- **Operations**: Trade processing and fee management
- **Management**: Read-only access to all modules
- **External User**: Limited read-only access

## 📊 Dashboards & Reports

### Number Cards
- Total AUM
- Active Clients
- Retrocession Fees (YTD)
- Open Compliance Tasks
- Pending KYC Reviews
- Trades (This Month)
- Overdue Reviews

### Charts
- AUM Over Time (Line chart)
- Client Growth (Bar chart)
- Retrocession by Custodian (Bar chart)
- Compliance Tasks Status (Pie chart)
- Portfolio Holdings by Type (Pie chart)

### Reports
- Portfolio Statement: Client-facing portfolio holdings report
- Transaction History: Internal trade audit report
- Fee & Retrocession Summary: Financial reconciliation report

## 🔄 Workflows

### KYC Onboarding Workflow
1. **Not Started** → **Onboarding In Progress** (RM)
2. **Onboarding In Progress** → **KYC Pending** (RM)
3. **KYC Pending** → **KYC Review** (RM)
4. **KYC Review** → **KYC Approved** (Compliance Officer)
5. **KYC Approved** → **Onboarded** (RM)
6. **KYC Review** → **Rejected** (Compliance Officer)

## 🔔 Notifications

- KYC Approved: Notifies RM when KYC is approved
- Fee Report Due: Reminds Ops 7 days before fee period ends
- Trade Settlement Failed: Alerts Ops and RM for failed trades

## 🚀 Deployment

### Frappe Cloud
This app is fully compatible with Frappe Cloud deployment. Simply:
1. Connect the repository to your Frappe Cloud account
2. Install the app through the Frappe Cloud interface
3. All fixtures and customizations will be automatically applied

### Self-Hosted
Follow the installation instructions above. The app uses only upgrade-safe customizations and will not interfere with ERPNext core functionality.

## 🔒 Security & Compliance

- All customizations are upgrade-safe
- No core ERPNext or Frappe files are modified
- Role-based access control implemented
- Audit trails for all critical operations
- KYC workflow ensures regulatory compliance

## 📈 Business Benefits

- **Streamlined Onboarding**: Automated KYC workflow reduces manual effort
- **Real-time AUM Tracking**: Automated portfolio value calculations
- **Compliance Automation**: Automated task management and reviews
- **Fee Management**: Automated fee calculations and retrocession tracking
- **Reporting**: Comprehensive dashboards for decision making

## 🤝 Support

For support and questions:
- **Email**: admin@onestonecapital.com
- **Documentation**: See inline code comments and this README
- **Issues**: Use GitHub Issues for bug reports and feature requests

## 📄 License

MIT License - see LICENSE file for details

## 🔄 Version History

- **v1.0.0**: Initial release with all core modules
- Compatible with ERPNext v15+ and Frappe v15+

---

**One Stone Capital EAM System** - Professional Wealth Management for the Modern Era 