<Serializable()> Public Class MyGroupInfo
    Inherits ReadOnlyBase(Of MyGroupInfo)

#Region " Business Methods "

    Private _groupId As String = ""
    Private _description As String = ""
    Private _members As MyGroupMemberList = MyGroupMemberList.NewGroupMemberList
    Private _roles As MyGroupRoleList = MyGroupRoleList.NewGroupRoleList

    Public ReadOnly Property GroupId() As String
        Get
            Return _groupId
        End Get
    End Property

    Public ReadOnly Property Description() As String
        Get
            Return _description
        End Get
    End Property

    Public ReadOnly Property Members() As MyGroupMemberList
        Get
            Return _members
        End Get
    End Property

    Public ReadOnly Property Roles() As MyGroupRoleList
        Get
            Return _roles
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return _groupId
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetGroup(ByVal id As String) As MyGroupInfo
        Dim obj As MyGroupInfo = DataPortal.Fetch(Of MyGroupInfo)(New Criteria(id))
        'TODO check if id is empty or not
        If String.IsNullOrEmpty(obj.GroupId) Then
            Return Nothing
        End If
        Return obj
    End Function

    Public Shared Function GetGroup(ByVal dr As SafeDataReader) As MyGroupInfo
        Return New MyGroupInfo(dr)
    End Function

    Private Sub New(ByVal dr As Csla.Data.SafeDataReader)
        DataPortal_Fetch(dr)
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
                cm.CommandType = CommandType.Text
                cm.CommandText = "SELECT groupId, groupDesc FROM mGroup WHERE groupId = @groupId"
                cm.Parameters.AddWithValue("@groupId", criteria.Id)

                Using dr As New SafeDataReader(cm.ExecuteReader)
                    If dr.Read Then
                        DataPortal_Fetch(dr)

                        dr.NextResult()
                        _members = MyGroupMemberList.GetGroupMemberList(dr)

                        dr.NextResult()
                        _roles = MyGroupRoleList.GetGroupRoleList(dr)
                    End If
                End Using
            End Using
        End Using
    End Sub

    Private Overloads Sub DataPortal_Fetch(ByVal dr As SafeDataReader)
        With dr
            _groupId = .GetString("groupId")
            _description = .GetString("groupDesc")
        End With
    End Sub

#End Region

End Class
