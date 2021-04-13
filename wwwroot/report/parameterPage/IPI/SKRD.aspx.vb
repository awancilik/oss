Option Explicit On
Option Strict On
Imports System
Partial Class report_parameterPage_IPI_SKRD
    Inherits System.Web.UI.Page
    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim nopermohonan As String = NoPermohonanASPxTextbox.Text.Trim
        Dim rSKRD As New SKRD.Parameters(nopermohonan)
        rSKRD.OpenReportInNewWindow()
    End Sub
End Class
