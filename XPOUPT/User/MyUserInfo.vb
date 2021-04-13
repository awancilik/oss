<Serializable()> Public Class MyUserInfo
    Inherits ReadOnlyBase(Of MyUserInfo)

#Region " Business Methods "

    Private _userId As String = ""
    Private _userName As String = ""
    Private _userPassword As MyPassword = MyPassword.Empty
    Private _userDesc As String = ""
    Private _roles As MyGroupRoleList = MyGroupRoleList.NewGroupRoleList

    Public ReadOnly Property UserId() As String
        Get
            Return _userId
        End Get
    End Property

    Public ReadOnly Property UserName() As String
        Get
            Return _userName
        End Get
    End Property

    Public ReadOnly Property UserPassword() As MyPassword
        Get
            Return _userPassword
        End Get
    End Property

    Public ReadOnly Property UserDesc() As String
        Get
            Return _userDesc
        End Get
    End Property

    Public ReadOnly Property Roles() As MyGroupRoleList
        Get
            Return _roles
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return _userId
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetInfo(ByVal id As String) As MyUserInfo
        Return DataPortal.Fetch(Of MyUserInfo)(New Criteria(id))
    End Function

    Public Shared Function GetInfo(ByVal dr As SafeDataReader) As MyUserInfo
        Return New MyUserInfo(dr)
    End Function

    Private Sub New(ByVal dr As SafeDataReader)
        Dataportal_fetch(dr)
    End Sub

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> Private Class Criteria
        Private _id As String
        Public ReadOnly Property Id() As String
            Get
                Return _id
            End Get
        End Property
        Public Sub New(ByVal id As String)
            _id = id
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                With cm
                    .CommandType = CommandType.Text
                    .CommandText = "SELECT userId, userName, userPassword, userDesc FROM mUser where userId = @userId;" & _
                                    "SELECT RO.RoleId, RO.RoleTitle FROM mUser U JOIN mUserGroup G on G.UserId = U.UserId " & _
                                    "JOIN mGroupRole R on R.GroupId = G.GroupId JOIN mRole RO on RO.RoleId = R.RoleId where U.userId = @userId;"

                    .Parameters.AddWithValue("@userId", criteria.Id)

                    Using dr As New SafeDataReader(.ExecuteReader)
                        If dr.Read Then
                            Me.DataPortal_Fetch(dr)

                            dr.NextResult()
                            _roles = MyGroupRoleList.GetGroupRoleList(dr)
                        End If
                    End Using
                End With
            End Using
        End Using
    End Sub

    Private Overloads Sub Dataportal_fetch(ByVal dr As SafeDataReader)
        With dr
            _userId = .GetString("userId")
            _userName = .GetString("userName")
            _userPassword = MyPassword.NewPassword(.GetString("userPassword"))
            _userDesc = .GetString("userDesc")
        End With
    End Sub

#End Region

End Class
