Option Explicit On
Option Strict On

Imports Bisnisobjek
Imports System.Web

Public NotInheritable Class LoginUtility

    Private Const SESSION_CURRENT_USER_INFO As String = "UserInfo"

    Public Shared Function Login(ByVal id As String, ByVal pwd As String) As Boolean
        If myPrincipal.Login(id, pwd) Then
            HttpContext.Current.Session("CslaPrincipal") = Csla.ApplicationContext.User
            Dim userInfo As MyUserInfo = MyUserInfo.GetInfo(HttpContext.Current.User.Identity.Name)
            HttpContext.Current.Session(SESSION_CURRENT_USER_INFO) = userInfo
            Return True
        End If
        Return False
    End Function

    Public Shared Sub Logout()
        MyPrincipal.Logout()
        HttpContext.Current.Session("CslaPrincipal") = Csla.ApplicationContext.User
        HttpContext.Current.Session.Clear()
        System.Web.Security.FormsAuthentication.SignOut()
        HttpContext.Current.Response.Redirect(System.Web.Security.FormsAuthentication.DefaultUrl, True)
    End Sub

    Public Shared Function GetCurrentUserInfo() As MyUserInfo
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            Dim obj As Object = HttpContext.Current.Session(SESSION_CURRENT_USER_INFO)
            If obj Is Nothing OrElse Not TypeOf obj Is MyUserInfo Then
                Dim userInfo As MyUserInfo = MyUserInfo.GetInfo(HttpContext.Current.User.Identity.Name)
                If Not userInfo Is Nothing Then
                    HttpContext.Current.Session(SESSION_CURRENT_USER_INFO) = userInfo
                    Return userInfo
                End If
            Else
                Return DirectCast(obj, MyUserInfo)
            End If
        Else
            System.Web.Security.FormsAuthentication.RedirectToLoginPage()
        End If
        Return Nothing
    End Function

    Public Shared Function GetCurrentUserName() As String
        Dim obj As MyUserInfo = GetCurrentUserInfo()
        If obj Is Nothing Then
            Return "[unknown]"
        Else
            Return obj.UserName
        End If
    End Function

    Public Shared Function GetCurrentUserId() As String
        If Not HttpContext.Current.User.Identity.IsAuthenticated Then
            System.Web.Security.FormsAuthentication.RedirectToLoginPage()
        End If
        Return HttpContext.Current.User.Identity.Name
    End Function

    Private Sub New()
        ' Prevent creation
    End Sub

End Class
