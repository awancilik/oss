Option Explicit On
Option Strict On

Partial Class report_hrPetikanIPB
    Inherits System.Web.UI.Page
    Protected Sub NoIPBButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoIPBButton.Click
        Dim NoIPB As String = NoIPBtextBox.Text
        Dim petIPB As New rPetikanIPB.Parameters(NoIPB)
        petIPB.OpenReportInNewWindow()
    End Sub
End Class
