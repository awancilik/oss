Option Explicit On
Option Strict On
Partial Class report_hrSKRD
    Inherits System.Web.UI.Page

    Protected Sub noPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles noPermohonanButton.Click
        Dim noPermohonan As String = NoPermohonanTextBox.Text
        Dim rSKRD As New SKRD.Parameters(noPermohonan)
        rSKRD.OpenReportInNewWindow()
    End Sub
End Class
