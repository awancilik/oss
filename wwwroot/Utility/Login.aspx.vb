Option Explicit On
Option Strict On
Imports System
Imports System.Security.Cryptography
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS

Partial Class Utility_Login
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
    End Sub

    Protected Sub Login1_LoggingIn(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles Login1.LoggingIn
        Dim user As String = Login1.UserName
        Dim pass As String = Login1.Password
        encryp(pass)
        Dim query As CriteriaOperator = CriteriaOperator.Parse("User='" & user & "' AND Password ='" & pass & "'")
    End Sub

    Private Sub encryp(ByVal pass As String)
        Dim en As X509Certificates.X509Chain = Nothing

        Try

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub CreateUserWizard1_CreatingUser(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles CreateUserWizard1.CreatingUser
        CreateUserWizard1.AutoGeneratePassword.ToString()
    End Sub
End Class
