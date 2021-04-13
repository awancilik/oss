Imports System.Security.Principal

<Serializable()> Public Class MyPrincipal
    Inherits Csla.Security.BusinessPrincipalBase

    Private Sub New(ByVal identity As IIdentity)
        MyBase.New(identity)
    End Sub

    Public Shared Function Login(ByVal username As String, ByVal password As String) As Boolean
        Dim identity As MyIdentity = MyIdentity.GetIdentity(username, password)
        If identity.IsAuthenticated Then
            Dim principal As New MyPrincipal(identity)
            Csla.ApplicationContext.User = principal
        End If
        Return identity.IsAuthenticated
    End Function

    Public Shared Sub Logout()
        Dim identity As MyIdentity = MyIdentity.UnauthenticatedIdentity
        Dim principal As New MyPrincipal(identity)
        Csla.ApplicationContext.User = principal
    End Sub

    Public Overrides Function IsInRole(ByVal role As String) As Boolean
        Dim identity As MyIdentity = DirectCast(Me.Identity, MyIdentity)
        Return identity.IsInRole(role)
    End Function

End Class
