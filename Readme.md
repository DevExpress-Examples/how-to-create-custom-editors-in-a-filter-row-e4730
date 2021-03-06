<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to create custom editors in a filter row
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4730/)**
<!-- run online end -->


<p>This example demonstrates how to filter a range of dates using a custom <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewGridViewTemplates_FilterCelltopic"><u>FilterCell Template</u></a>. It also demonstrates the use of custom editors in column filter cells, including Apply/Clear buttons in a command column.<br />
</p><p>Custom filter buttons are implemented by <a href="http://help.devexpress.com/#AspNet/clsDevExpressWebASPxEditorsASPxHyperLinktopic"><u>ASPxHyperlink</u></a> controls. Their visibility is set in the <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxClassesScriptsASPxClientControl_Inittopic"><u>Init</u></a> event handler, using the flag ("filtered" variable). When these buttons are clicked, they set/clear the filter of the Grid and also switch the flag.</p><p>We need to use a custom template for all the columns, so we create the <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxEditorsASPxTextBoxtopic"><u>ASPxTextBoxes</u></a>, applying <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsASPxEditBase_ClientInstanceNametopic"><u>ClientInstanceName</u></a>, formed with the help of the current column index. We need to do so, to access them later in the code.</p><p><br />
Our ApplyFilter method is building a filter expression. To learn more about the syntax of the criteria language see <a href="http://documentation.devexpress.com/#XPO/CustomDocument4928"><u>here</u></a>. In the ApplyFilter method we iterate through Grid columns. If we use a common control (ASPxTextBox) we just add criteria if it contains some text, but if we use our custom column, we utilize a special method to form the date range criteria and add it to the filter criteria expression. After that we apply this filter expression to our Grid using <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_ApplyFiltertopic"><u>ApplyFilter</u></a> method. To clear filter we use <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_ClearFiltertopic"><u>ClearFilter</u></a> in the Click event of our clear button.</p>

<br/>


