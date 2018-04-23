Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Data.Filtering

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub dFrom_Init(ByVal sender As Object, ByVal e As EventArgs)
		CType(sender, ASPxDateEdit).Date = New DateTime(1950, 1, 1)
	End Sub

	Protected Sub dTo_Init(ByVal sender As Object, ByVal e As EventArgs)
		CType(sender, ASPxDateEdit).Date = New DateTime(1960, 11, 30)
	End Sub
End Class
