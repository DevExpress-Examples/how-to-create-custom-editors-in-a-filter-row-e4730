<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to create custom editors in filter row</title>
    <script type="text/javascript">
        var filtered = false;

        function ApplyFilter() {
            var filterCondition = '';
            var andOperator = '';

            for (var i = 0; i < grid.GetColumnsCount(); i++) {
                if (filterCondition != '')
                    andOperator = ' And ';

                try {
                    //Column with a common custom template
                    var editor = eval('filterRow_' + i);
                    if (editor.GetText() != '')
                        filterCondition = filterCondition + andOperator + "Contains([" + grid.GetColumn(i).fieldName + "]," + "'" + editor.GetText() + "')";
                    continue;
                } catch (e) { 
                    //Column with a different custom template
                }

                if (grid.GetColumn(i).fieldName == 'BirthDate' && dFrom.GetText() != '' && dTo.GetText() != '') {
                    filterCondition = filterCondition + andOperator + '([BirthDate] >= #' + dFrom.GetText() + '#) And ([BirthDate] <= #' + dTo.GetText() + "#)";
                }
            }

            filtered = true;
            grid.ApplyFilter(filterCondition);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="ads" KeyFieldName="EmployeeID">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <FilterTemplate>
                        <dx:ASPxHyperLink runat="server" Text="Apply" ID="btnApply" ClientInstanceName="btnApply">
                            <ClientSideEvents Click="function (s, e) {
                                    ApplyFilter();
                                }" Init="function (s, e) { s.SetVisible(!filtered); }" />
                        </dx:ASPxHyperLink>
                        <dx:ASPxHyperLink runat="server" Text="Clear" ID="btnClear" ClientInstanceName="btnClear">
                            <ClientSideEvents Click="function (s, e) {
                                    filtered = false;
                                    grid.ClearFilter();
                                }" Init="function (s, e) { s.SetVisible(filtered); }" />
                        </dx:ASPxHyperLink>
                    </FilterTemplate>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="4" Width="200px">
                    <FilterTemplate>
                        <asp:Label runat="server" ID="lblFrom" Text="From"></asp:Label>
                        <dx:ASPxDateEdit runat="server" ID="deFrom" ClientInstanceName="dFrom" OnInit="dFrom_Init">
                        </dx:ASPxDateEdit>
                        <asp:Label runat="server" ID="lblTo" Text="To"></asp:Label>
                        <dx:ASPxDateEdit runat="server" ID="deTo" ClientInstanceName="dTo" OnInit="dTo_Init">
                        </dx:ASPxDateEdit>
                    </FilterTemplate>
                </dx:GridViewDataDateColumn>
            </Columns>
            <SettingsBehavior AutoFilterRowInputDelay="-1" />
            <Settings ShowFilterRow="True" />
            <Templates>
                <FilterCell>
                    <dx:ASPxTextBox runat="server" ClientInstanceName='<%# "filterRow_" + Container.Column.Index %>'>
                    </dx:ASPxTextBox>
                </FilterCell>
            </Templates>
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [BirthDate] FROM [Employees]">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
