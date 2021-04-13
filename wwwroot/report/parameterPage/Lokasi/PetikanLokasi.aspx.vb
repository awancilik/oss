Option Explicit On
Option Strict On
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports System

Partial Class report_parameterPage_Lokasi_PetikanLokasi
    Inherits System.Web.UI.Page
    Protected Sub PetikSementaraButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PetikSementaraButton.Click
        Dim noPetSementara As String = PetikSementaraTxtBox.Text
        Dim repPetSementara As New PetikanLokasi.Parameters(noPetSementara)
        repPetSementara.OpenReportInNewWindow()
    End Sub
End Class
