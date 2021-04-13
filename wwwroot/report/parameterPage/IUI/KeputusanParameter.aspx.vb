Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports System

Partial Class report_parameterPage_IUI_KeputusanParameter
    Inherits System.Web.UI.Page

    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim noPermohonan As String = NoPermohonanTextBox.Text
        Dim ReportIUI As New KeputusanIUIReport.Parameters(noPermohonan)
        ReportIUI.OpenReportInNewWindow()
    End Sub

End Class
