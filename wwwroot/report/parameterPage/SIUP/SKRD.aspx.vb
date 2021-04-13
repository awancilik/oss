Option Explicit On
Option Strict On

Partial Class report_parameterPage_SIUP_SKRD
    Inherits System.Web.UI.Page
    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim noPermohonan As String = NoPermohonanTextBox.Text.Trim.ToString
        Dim SKRD As New SIUPSKRD1.Parameters(noPermohonan)
        SKRD.OpenReportInNewWindow()
    End Sub
End Class
