Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports System
Partial Class report_parameterPage_IPT_KeputusanIPT
    Inherits System.Web.UI.Page

    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim nopermohonan As String = NoPermohonanTextBox.Text
        Dim reportIPT As New KeputusanIPTReport.Parameters(nopermohonan)
        reportIPT.OpenReportInNewWindow()
    End Sub
End Class
