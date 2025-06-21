# One Stone Capital EAM Overrides
# Upgrade-safe dashboard and method overrides

import frappe
from frappe import _

def customer_dashboard():
    """Override Customer dashboard for EAM functionality"""
    return {
        "fieldname": "name",
        "transactions": [
            {
                "label": _("Portfolio"),
                "items": ["AUM Portfolio"]
            },
            {
                "label": _("Trades"),
                "items": ["Trade"]
            },
            {
                "label": _("Compliance"),
                "items": ["Compliance Task", "Client Review"]
            }
        ]
    }

def portfolio_dashboard():
    """Override AUM Portfolio dashboard"""
    return {
        "fieldname": "customer",
        "transactions": [
            {
                "label": _("Holdings"),
                "items": ["Portfolio Holding"]
            },
            {
                "label": _("Trades"),
                "items": ["Trade"]
            },
            {
                "label": _("Fees"),
                "items": ["Fee Report"]
            }
        ]
    }

def trade_dashboard():
    """Override Trade dashboard"""
    return {
        "fieldname": "portfolio",
        "transactions": [
            {
                "label": _("Portfolio"),
                "items": ["AUM Portfolio"]
            },
            {
                "label": _("Holdings"),
                "items": ["Portfolio Holding"]
            }
        ]
    }

def fee_report_dashboard():
    """Override Fee Report dashboard"""
    return {
        "fieldname": "portfolio",
        "transactions": [
            {
                "label": _("Portfolio"),
                "items": ["AUM Portfolio"]
            }
        ]
    }

def get_dashboard_chart_data(chart_name, filters=None, refresh=None, from_date=None, to_date=None, timespan=None, time_interval=None, heatmap_year=None):
    """Override dashboard chart data for EAM-specific charts"""
    # Placeholder for custom chart data logic
    return frappe.desk.doctype.dashboard_chart.dashboard_chart.get(
        chart_name, filters, refresh, from_date, to_date, timespan, time_interval, heatmap_year
    ) 