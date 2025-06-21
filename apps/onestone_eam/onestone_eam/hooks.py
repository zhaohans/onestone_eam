# One Stone Capital EAM Hooks
# Upgrade-safe customizations only

app_name = "onestone_eam"
app_title = "One Stone Capital EAM"
app_publisher = "One Stone Capital"
app_description = "Wealth/EAM (External Asset Manager) system for One Stone Capital"
app_email = "admin@onestonecapital.com"
app_license = "MIT"

# Fixtures to export
fixtures = [
    {
        "doctype": "Custom Field",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Property Setter", 
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Workflow",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Workflow State",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Workflow Action",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Role",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Custom DocType",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Server Script",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Client Script",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Notification",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Print Format",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Report",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Dashboard",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Dashboard Chart",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Number Card",
        "filters": [["module", "in", ["onestone_eam"]]]
    },
    {
        "doctype": "Workspace",
        "filters": [["module", "in", ["onestone_eam"]]]
    }
]

# App configuration
app_config = {
    "app_name": "onestone_eam",
    "app_title": "One Stone Capital EAM",
    "app_description": "Wealth/EAM (External Asset Manager) system for One Stone Capital",
    "app_publisher": "One Stone Capital",
    "app_email": "admin@onestonecapital.com",
    "app_url": "https://onestonecapital.com",
    "app_logo_url": "/assets/onestone_eam/images/logo.png",
    "app_icon": "octicon octicon-graph",
    "app_color": "#2E8B57",
    "app_version": "1.0.0",
    "app_license": "MIT"
}

# Override doctype dashboards
override_doctype_dashboards = {
    "Customer": "onestone_eam.overrides.customer_dashboard",
    "AUM Portfolio": "onestone_eam.overrides.portfolio_dashboard",
    "Trade": "onestone_eam.overrides.trade_dashboard",
    "Fee Report": "onestone_eam.overrides.fee_report_dashboard"
}

# Override whitelisted methods
override_whitelisted_methods = {
    "frappe.desk.doctype.dashboard_chart.dashboard_chart.get": "onestone_eam.overrides.get_dashboard_chart_data"
}

# Scheduled tasks
scheduler_events = {
    "daily": [
        "onestone_eam.compliance.tasks.mark_overdue_tasks"
    ]
}

# Document Events
doc_events = {
    "Customer": {
        "on_update": "onestone_eam.crm.events.on_customer_update",
        "after_insert": "onestone_eam.crm.events.on_customer_insert"
    },
    "Trade": {
        "on_submit": "onestone_eam.wealth.events.on_trade_submit",
        "on_cancel": "onestone_eam.wealth.events.on_trade_cancel"
    },
    "Fee Report": {
        "on_save": "onestone_eam.retrocession.events.on_fee_report_save"
    }
} 