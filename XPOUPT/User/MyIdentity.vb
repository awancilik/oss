Imports System.Security.Principal

<Serializable()> Public Class MyIdentity
    Inherits Csla.ReadOnlyBase(Of MyIdentity)

    Implements IIdentity

#Region " Business Methods "

    Protected Overrides Function GetIdValue() As Object
        Return _name
    End Function

#Region " IsInRole "

    Private _roles As New List(Of String)

    Friend Function IsInRole(ByVal role As String) As Boolean
        If role Is Nothing OrElse role.Length = 0 Then
            Return False
        Else
            Return _roles.Contains(role.Trim.ToLower)
        End If
    End Function

#End Region

#Region " IIdentity "

    Private _isAuthenticated As Boolean = False
    Private _name As String = ""

    Public ReadOnly Property AuthenticationType() As String Implements System.Security.Principal.IIdentity.AuthenticationType
        Get
            Return "Csla"
        End Get
    End Property

    Public ReadOnly Property IsAuthenticated() As Boolean Implements System.Security.Principal.IIdentity.IsAuthenticated
        Get
            Return _isAuthenticated
        End Get
    End Property

    Public ReadOnly Property Name() As String Implements System.Security.Principal.IIdentity.Name
        Get
            Return _name
        End Get
    End Property

#End Region

#End Region

#Region " Factory Methods "

    Friend Shared Function UnauthenticatedIdentity() As MyIdentity
        Return New MyIdentity
    End Function

    Friend Shared Function GetIdentity(ByVal username As String, ByVal password As String) As MyIdentity
        Return DataPortal.Fetch(Of MyIdentity)(New Criteria(username, password))
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> Private Class Criteria
        Public ReadOnly UserName As String = ""
        Public ReadOnly Password As String = ""

        Public Sub New(ByVal username As String, ByVal password As String)
            Me.UserName = username
            Me.Password = password
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                cm.CommandText = "SELECT userId, userPassword FROM mUser WHERE userId = @userId;" & _
                    "SELECT DISTINCT roleId FROM mUserGroup G " & _
                    "JOIN mGroupRole R ON G.groupId = R.groupId " & _
                    "WHERE G.userId = @userId"

                cm.CommandType = CommandType.Text
                cm.Parameters.AddWithValue("@userId", criteria.UserName)
                Using dr As New SafeDataReader(cm.ExecuteReader())
                    If dr.Read() Then
                        Dim storedPwd As MyPassword = MyPassword.Parse(dr.GetString("userPassword"))
                        Dim givenPwd As New MyPassword(criteria.Password, storedPwd)
                        _isAuthenticated = givenPwd.Equals(storedPwd)

                        If _isAuthenticated Then
                            _name = dr.GetString(0).Trim
                            If dr.NextResult Then
                                While dr.Read
                                    Dim role As String = dr.GetString(0).Trim.ToLower
                                    If Not _roles.Contains(role) Then
                                        _roles.Add(role)
                                    End If
                                End While
                            End If
                        End If

                    End If
                End Using
            End Using
        End Using

    End Sub

#End Region

End Class
