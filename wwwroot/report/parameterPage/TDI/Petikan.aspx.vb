Option Explicit On
Option Strict On
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Xpo
Partial Class report_parameterPage_TDI_Petikan
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim noPermohonan As String = noPermohonanASPxTextBox.Text.Trim

    End Sub
End Class
