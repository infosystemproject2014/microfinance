﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="checklistcat.ascx.cs" Inherits="controls_area" %>
<div class="row">
<div class="panel panel-default bootstrap-admin-no-table-panel">
    <div class="panel-heading">
        <div class="text-muted bootstrap-admin-box-title">Area</div>
    </div>
    <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
        <div class="form-horizontal">
            <fieldset>
                <legend><h5>Area</h5></legend>
                <input type="hidden" runat="server" id="editskip" /> 
                <div class="form-group">
                    <label class="col-lg-3 control-label" for="typeahead">Pre Approval:</label>
                    <div class="col-lg-9">
                        <input runat="server" type="text" class="form-control input-sm col-md-6" id="txtArea" autocomplete="off" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" for="typeahead">Description</label>
                    <div class="col-lg-9">
                        <input runat="server" type="text" class="form-control input-sm col-md-6" id="txtDescription" autocomplete="off" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" for="typeahead">Position</label>
                    <div class="col-lg-9">
                        <input runat="server" type="text" class="form-control input-sm col-md-6" id="txtPosition" autocomplete="off" >
                    </div>
                </div>
                
                <div class="form-group">
                   <div class="col-lg-10" >
                        <asp:Button ID="btnSave" style="height:25px;width:15%" 
                            class="btn btn-xs btn-success" runat="server" Text="SAVE" 
                            onclick="btnSave_Click" />
                       <%-- <button type="reset" style="height:25;width:15%" class="btn btn-xs btn-default">Cancel</button>--%>
                   </div>
                </div>
            </fieldset>
            <hr />
            
            <asp:GridView CssClass="table table-striped" ID="gvAsset" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="datID" 
                DataSourceID="SqlDataSource2" onrowdatabound="gvAsset_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="datDescription" HeaderText="Description" 
                        SortExpression="datDescription" />
                    <asp:TemplateField HeaderText="Edit">
                             <ItemTemplate>
                                 <asp:HyperLink ID="hyperEdit" runat="server"  Text="Edit">
                                    <span class="glyphicon glyphicon-edit"> Edit </span>
                                </asp:HyperLink>
                             </ItemTemplate>
                      </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:sa365ConnectionString1 %>" 
                SelectCommand="GetAreas" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
        </div>
    </div>
  </div>
</div>