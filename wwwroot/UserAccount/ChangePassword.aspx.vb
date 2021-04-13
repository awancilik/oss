Imports Bisnisobjek

Partial Class UserAccount_ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub OKButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OKButton.Click
        Dim userName As String = HttpContext.Current.User.Identity.Name
        Dim oldPassword As String = Me.CurrentPassword.Text.Trim
        Dim newPassword As String = Me.ConfirmNewPassword.Text.Trim
        Try
            If ChangePasswordCommand.Execute(userName, oldPassword, newPassword) Then
                MainMultiview.ActiveViewIndex = 1
            Else
                'Master.SetErrorMessage("Update sandi gagal, sandi yang anda masukkan salah")
            End If
        Catch ex As Exception
            'master.SetErrorMessage(ex.Message)
        End Try
    End Sub

End Class
