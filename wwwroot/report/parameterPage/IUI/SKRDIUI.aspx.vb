Option Explicit On
Option Strict On

Partial Class report_parameterPage_IUI_SKRDIUI
    Inherits System.Web.UI.Page
    Protected Sub noPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles noPermohonanButton.Click
        Dim noPermohonan As String = NoPermohonanTextBox.Text
        Dim rSKRD As New SKRDIUI.Parameters(noPermohonan)
        rSKRD.OpenReportInNewWindow()
    End Sub
End Class
