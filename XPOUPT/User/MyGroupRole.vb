Imports System.Data.SqlClient

<Serializable()> Public Class MyGroupRole
    Inherits Csla.BusinessBase(Of MyGroupRole)

#Region " Business Methods "

    Private _roleId As String = ""
    Private _roleTitle As String = ""

    Public ReadOnly Property RoleId() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return _roleId
        End Get
    End Property

    Public ReadOnly Property RoleTitle() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return _roleTitle
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return _roleId
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function NewGroupRole(ByVal roleId As String) As MyGroupRole
        Dim obj As MyGroupRole = DataPortal.Create(Of MyGroupRole)(New Criteria(roleId))
        If obj._roleId = "" Then
            Return Nothing
        End If
        Return obj
    End Function

    Friend Shared Function GetGroupRole(ByVal dr As Csla.Data.SafeDataReader) As MyGroupRole
        Return New MyGroupRole(dr)
    End Function

    Private Sub New()
        MarkAsChild()
    End Sub

    Private Sub New(ByVal dr As Csla.Data.SafeDataReader)
        MarkAsChild()
        Fetch(dr)
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

    Private Overloads Sub DataPortal_Create(ByVal criteria As Criteria)
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                cm.CommandType = CommandType.Text
                cm.CommandText = "SELECT roleId, roleTitle FROM mRole WHERE roleId = @roleId"

                cm.Parameters.AddWithValue("@roleId", criteria.Id)

                Using dr As New SafeDataReader(cm.ExecuteReader)
                    If dr.Read() Then
                        With dr
                            Fetch(dr)
                        End With
                    End If
                End Using

            End Using
        End Using
    End Sub

    Private Sub Fetch(ByVal dr As Csla.Data.SafeDataReader)
        _roleId = dr.GetString("roleId")
        _roleTitle = MyRoleInfo.GetRoleInfo(dr.GetString("roleId")).RoleTitle
        MarkOld()
    End Sub

    Friend Sub Insert(ByVal tr As SqlTransaction, ByVal parent As MyGroup)
        If Me.IsDirty Then
            Try
                Using cm As New SqlCommand
                    cm.Transaction = tr
                    cm.Connection = tr.Connection

                    cm.CommandType = CommandType.Text
                    cm.CommandText = "INSERT INTO mGroupRole (roleId, groupId) VALUES (@roleId, @groupId)"

                    cm.Parameters.AddWithValue("@roleId", _roleId)
                    cm.Parameters.AddWithValue("@groupId", parent.GroupId)

                    cm.ExecuteNonQuery()
                    MarkOld()
                End Using
            Catch ex As Exception
                Throw ex
            End Try
        End If
    End Sub

    Friend Sub DeleteSelf(ByVal parent As MyGroup)
        If Me.IsDirty AndAlso Not Me.IsNew Then
            Using cn As New SqlConnection(Database.DinnerDash)
                cn.Open()
                Using cm As SqlCommand = cn.CreateCommand
                    cm.CommandType = CommandType.Text
                    cm.CommandText = "DELETE mGroupRole WHERE (roleId = @roleId) AND (groupId = @groupId)"

                    cm.Parameters.AddWithValue("@roleId", _roleId)
                    cm.Parameters.AddWithValue("@groupId", parent.GroupId)

                    cm.ExecuteNonQuery()
                    MarkNew()
                End Using
            End Using
        End If
    End Sub

#End Region

End Class

