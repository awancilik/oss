Option Explicit On
Option Strict On

Partial Class report_Permohonan_Perijinan
    Inherits System.Web.UI.Page

    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim nopermohonan As String = NoPermohonanTextBox.Text
        Dim permohonan As New PermohonanReport.Parameters(nopermohonan, nopermohonan)
        permohonan.OpenReportInNewWindow()
    End Sub
End Class
