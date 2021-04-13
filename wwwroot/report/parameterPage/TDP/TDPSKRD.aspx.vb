Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports System
Partial Class report_parameterPage_TDP_TDPSKRD
    Inherits System.Web.UI.Page

    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim nopermohonan As String = NoPermohonanTextBox.Text
        Dim reporttdp As New SKRDTDP.Parameters(nopermohonan)
        reporttdp.OpenReportInNewWindow()
    End Sub
End Class