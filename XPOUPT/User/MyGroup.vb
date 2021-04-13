<Serializable()> Public Class MyGroup
    Inherits BusinessBase(Of MyGroup)

#Region " Business Methods "

    Private _groupId As String = ""
    Private _description As String = ""
    Private _members As MyGroupMemberList = MyGroupMemberList.NewGroupMemberList
    Private _roles As MyGroupRoleList = MyGroupRoleList.NewGroupRoleList

    Public Property GroupId() As String
        Get
            Return _groupId
        End Get
        Set(ByVal value As String)
            If Not value.Equals(_groupId) Then
                _groupId = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Description() As String
        Get
            Return _description
        End Get
        Set(ByVal value As String)
            If Not _description.Equals(value) Then
                _description = value
                PropertyHasChanged()
            End If
        End Set
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

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso _members.IsValid AndAlso _roles.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse _members.IsDirty OrElse _roles.IsDirty
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return _groupId
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function NewGroup() As MyGroup
        Return DataPortal.Create(Of MyGroup)()
    End Function

    Public Shared Function GetGroup(ByVal id As String) As MyGroup
        Dim obj As MyGroup = DataPortal.Fetch(Of MyGroup)(New Criteria(id))
        'TODO check if id is empty or not
        If String.IsNullOrEmpty(obj.GroupId) Then
            Return Nothing
        End If
        Return obj
    End Function

    Public Shared Sub DeleteGroup(ByVal id As String)
        DataPortal.Delete(New Criteria(id))
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

    Protected Overrides Sub DataPortal_Create()

    End Sub

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                cm.CommandType = CommandType.Text
                cm.CommandText = "SELECT groupId, groupDesc FROM mGroup WHERE groupId = @groupId;" & _
                                "SELECT U.* FROM mUserGroup G JOIN mUser U on U.userId = G.userId WHERE G.groupId = @groupId;" & _
                                "SELECT groupId, roleId FROM mGroupRole WHERE groupId = @groupId;"

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

    Protected Overrides Sub DataPortal_Insert()
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                With cm
                    Using tr As SqlTransaction = cn.BeginTransaction(IsolationLevel.Serializable)
                        Try
                            .Connection = tr.Connection
                            .Transaction = tr
                            .CommandType = CommandType.Text
                            .CommandText = "INSERT INTO mGroup (groupId, groupDesc)VALUES(@groupId, @groupDesc)"

                            Me.DoInsertUpdate(cm)

                            _members.Update(tr, Me)
                            _roles.Update(tr, Me)

                            tr.Commit()
                        Catch ex As Exception
                            tr.Rollback()
                            Throw ex
                        End Try
                    End Using
                End With
            End Using
        End Using
    End Sub

    Protected Overrides Sub DataPortal_Update()
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As New SqlCommand
                With cm
                    Using tr As SqlTransaction = cn.BeginTransaction(IsolationLevel.Serializable)
                        Try
                            .Connection = tr.Connection
                            .Transaction = tr
                            .CommandType = CommandType.Text
                            .CommandText = "UPDATE mGroup SET groupDesc = @groupDesc WHERE groupId = @groupId"

                            Me.DoInsertUpdate(cm)

                            _roles.Update(tr, Me)
                            _members.Update(tr, Me)

                            tr.Commit()
                        Catch ex As Exception
                            tr.Rollback()
                            Throw ex
                        End Try
                    End Using
                End With
            End Using
        End Using
    End Sub

    Private Sub DoInsertUpdate(ByVal cm As SqlCommand)
        With cm
            .Parameters.AddWithValue("@groupId", _groupId)
            .Parameters.AddWithValue("@groupDesc", _description)

            .ExecuteNonQuery()
        End With
    End Sub

    Private Overloads Sub DataPortal_Delete(ByVal criteria As Criteria)
        Dim affectedRows As Integer = 0
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As New SqlCommand
                With cm
                    Using tr As SqlTransaction = cn.BeginTransaction(IsolationLevel.Serializable)
                        Try
                            .Connection = tr.Connection
                            .Transaction = tr
                            .CommandType = CommandType.Text
                            .CommandText = "DELETE FROM mGroup WHERE groupId = @groupId"
                            .Parameters.AddWithValue("@groupId", criteria.Id)

                            .ExecuteNonQuery()
                            tr.Commit()
                        Catch ex As Exception
                            tr.Rollback()
                            Throw ex
                        End Try
                    End Using
                End With
            End Using
        End Using
    End Sub


#End Region

End Class
