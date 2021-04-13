Option Explicit On
Option Strict On

Partial Class report_KeputusanIPB
    Inherits System.Web.UI.Page
    Protected Sub NoIPBButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoIPBButton.Click
        Dim noIPB As String = NoIPBTextBox.Text
        Dim kepIPB As New reportKeputusanIPB.Parameters(noIPB)
        kepIPB.OpenReportInNewWindow()
    End Sub
End Class
