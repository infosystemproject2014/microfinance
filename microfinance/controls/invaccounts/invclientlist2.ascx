﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="invclientlist2.ascx.cs" Inherits="controls_invaccounts_invclientlist2" %>
<script type="text/javascript" language="javascript">
    function loadAlertPop(pid)
    {
        $('#<%=appID.ClientID %>').val(pid);
        $.blockUI({ message: $('#<%=myAlertPopUp.ClientID %>'), css: {width: '50%',padding:'5px'} });
    }
    $(document).ready(function() {   
        $('#<%=btnSaveAlert.ClientID%>').click(function() {
          $.blockUI();
          $.ajax({
            type: "POST",
            url: "btnSaveAlert_Click",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: true,
            success: function(msg) {
                $.unblockUI();
              }
            });
         });
    });
</script>
<p style="margin: 0">
    <asp:Label ID="lblHeading" runat="server" Style="font-weight: 700" Text="Number of Investment(s)"></asp:Label><span
        runat="server" id="noClients" class="badge pull-right"></span>
</p>
<hr />
<div runat="server" class="" id="myAlertPopUp" style="display: none">
    <input type="hidden" id="appID" runat="server" />
    <div class="panel panel-default bootstrap-admin-no-table-panel">
        <div class="panel-heading">
            <div class="text-muted bootstrap-admin-box-title">
                Alert Message
            </div>
        </div>
        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
            <form class="form-horizontal">
            <fieldset>
                <legend>Alert Message</legend>
                <div class="form-group">
                    <div class="col-lg-12">
                        <textarea runat="server" style="height: 100px" class="form-control input-sm" id="alertmsg"> </textarea>
                    </div>
                </div>
                <br style="clear: both" />
                <hr />
                <div class="form-group">
                    <div class="col-md-12">
                        <asp:Button ID="btnSaveAlert" Style="width: 15%" CssClass="btn btn-xs btn-primary"
                            runat="server" Text="Save"  />
                        <asp:Button class="btn btn-xs btn-default" ID="btnClose" OnClientClick="location.reload();"
                            runat="server" Text="Button" />
                        <%--<button  style="width:15%"  type="reset">Close</button>--%>
                    </div>
                </div>
            </fieldset>
            </form>
        </div>
    </div>
</div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="datID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="datInvestmentName" HeaderText="Investment Name" 
            SortExpression="datInvestmentName" />
        <asp:BoundField DataField="datApplicationNumber" HeaderText="Application No." 
            SortExpression="datApplicationNumber" />
        <asp:BoundField DataField="datInvestmentType" HeaderText="Type" 
            SortExpression="datInvestmentType" />
        <asp:BoundField DataField="datDaysOver" HeaderText="datDaysOver" 
            SortExpression="datDaysOver" />
        <asp:TemplateField HeaderText="Action"></asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:sa365ConnectionString1 %>" 
    
    SelectCommand="SELECT datID, datInvestmentName, datApplicationNumber, datInvestmentType, datDaysOver FROM tbl_investment_accounts WHERE (datActiveAccountStatus = 3) AND (datTeamID = @branchID)">
    <SelectParameters>
        <asp:Parameter Name="branchID" />
    </SelectParameters>
</asp:SqlDataSource>