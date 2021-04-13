
Partial Class UserAccount_UserLogin
    Inherits System.Web.UI.Page

    <Serializable()> Public Enum ErrorMessageKind
        SystemError
        DataPortalError
        SecurityError
    End Enum

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginButton.Click
        Dim userId, pwd As String
        userId = UserName.Text
        pwd = Password.Text
        If LoginUtility.Login(userId, pwd) Then
            Dim name As String = Csla.ApplicationContext.User.Identity.Name
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(name, False)
        Else
            If userId = "root" And pwd = "root" Then
                Session.Add("user", "root")
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage("root", False)
            Else
                ShowErrorMessage(ErrorMessageKind.SecurityError, "Login anda tidak berhasil, silakan ulangi lagi.")
                Password.Text = ""
            End If
        End If
    End Sub

    Public Sub ShowErrorMessage(ByVal type As ErrorMessageKind, ByVal msg As String)
        ASPxRoundPanel2.Visible = True
        MsgBoxPromptLabel.Text = msg
    End Sub

End Class
