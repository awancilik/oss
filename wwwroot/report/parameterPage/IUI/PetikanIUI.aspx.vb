
Partial Class report_parameterPage_IUI_PetikanIUI
    Inherits System.Web.UI.Page

    Protected Sub PetikSementaraButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PetikSementaraButton.Click
        Dim noPetSementara As String = PetikSementaraTxtBox.Text
        Dim repPetSementara As New PetikanIUI.Parameters(noPetSementara)
        repPetSementara.OpenReportInNewWindow()
    End Sub

End Class
