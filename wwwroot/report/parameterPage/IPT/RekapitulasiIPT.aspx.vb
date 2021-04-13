Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports System
Partial Class report_parameterPage_IPT_RekapitulasiIPT
    Inherits System.Web.UI.Page

    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim bulan As String = CStr(DateEditASPxDateEdit.Date.Month)
        Dim tahun As String = CStr(DateEditASPxDateEdit.Date.Year)
        Dim rekap As New RekapitulasiIPT.Parameters(bulan, tahun)
        rekap.OpenReportInNewWindow()
    End Sub
End Class
