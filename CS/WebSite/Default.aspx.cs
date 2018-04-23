using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using DevExpress.Data.Filtering;

public partial class _Default : System.Web.UI.Page
{
    protected void dFrom_Init(object sender, EventArgs e)
    {
        ((ASPxDateEdit)sender).Date = new DateTime(1950, 1, 1);
    }

    protected void dTo_Init(object sender, EventArgs e)
    {
        ((ASPxDateEdit)sender).Date = new DateTime(1960, 11, 30);
    }
}
