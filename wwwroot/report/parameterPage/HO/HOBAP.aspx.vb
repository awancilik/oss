Option Strict On
Option Explicit On

Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports System

Partial Class report_parameterPage_HO_HOBAP
    Inherits System.Web.UI.Page

    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim nopermohonan As String = NoPermohonanTextBox.Text
        Dim reportbap As New HOBAPreport.Parameters(nopermohonan)
        reportbap.OpenReportInNewWindow()
    End Sub
End Class
