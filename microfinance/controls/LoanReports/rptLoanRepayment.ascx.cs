﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Globalization;
using Microsoft.Reporting.WebForms;

public partial class controls_LoanReports_rptLoanRepayment : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.rvLoanRepayment.Visible = false;
    }
    protected void btnViewReport_Click(object sender, EventArgs e)
    {
        bindReport();
    }

    private void bindReport()
    {
        try 
        {

            string name = "";
            try
            {
                usersTableAdapters.GetUserNameTableAdapter user = new usersTableAdapters.GetUserNameTableAdapter();
                users.GetUserNameDataTable tblUser = user.GetUserName(MySessionManager.CurrentUser.UserID);
                name = tblUser[0].name.ToString();
            }
            catch (Exception ex) { }

             this.rvLoanRepayment.Visible = true;
             // fetch the en-GB culture
             CultureInfo ukCulture = new CultureInfo("en-GB");
             // pass the DateTimeFormat information to DateTime.Parse
             DateTime fromDT = DateTime.Parse(txtFromDT.Text, ukCulture.DateTimeFormat);
             DateTime toDT = DateTime.Parse(txtToDT.Text, ukCulture.DateTimeFormat);

             this.ObjectDataSource1.SelectParameters["BranchID"].DefaultValue = ddlBranch.SelectedValue;
             this.ObjectDataSource1.SelectParameters["CMID"].DefaultValue = ddlBranch.SelectedValue;
             this.ObjectDataSource1.SelectParameters["FromDT"].DefaultValue = fromDT.ToShortDateString();
             this.ObjectDataSource1.SelectParameters["ToDT"].DefaultValue = toDT.ToShortDateString();

             ReportParameter rp1 = new ReportParameter("Report_Date", DateTime.Now.ToString("dd-MM-yyyy"));
             ReportParameter rp3 = new ReportParameter("fromDate", txtFromDT.Text);
             ReportParameter rp4 = new ReportParameter("toDate", txtToDT.Text);
             ReportParameter rp2 = new ReportParameter("Report_Generator", name);
             rvLoanRepayment.LocalReport.SetParameters(new ReportParameter[] { rp1, rp2, rp3, rp4 });
             rvLoanRepayment.DataBind();
             rvLoanRepayment.LocalReport.Refresh();
         
        }catch(Exception ex){}
        
        
        //throw new NotImplementedException();
    }
    protected void ShowMessageBox(string message)
    {
        string sJavaScript = "<script language=javascript>\n";
        sJavaScript += "alert('" + message + "');\n";
        sJavaScript += "</script>";
        this.Page.RegisterStartupScript("MessageBox", sJavaScript);
    }
}
