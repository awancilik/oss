Imports System.Data.SqlClient

<Serializable()> Public Class MyGroupMember
    Inherits Csla.BusinessBase(Of MyGroupMember)

#Region " Business Methods "

    ' TODO: add your own fields, properties and methods

    Private _userId As String = ""
    Private _userName As String = ""
    Private _userDesc As String = ""

    Public ReadOnly Property UserId() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return _userId
        End Get
    End Property

    Public ReadOnly Property UserName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return _userName
        End Get
    End Property

    Public ReadOnly Property UserDesc() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            Return _userDesc
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return _userId
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function NewGroupMember(ByVal memberId As String) As MyGroupMember
        Dim obj As MyGroupMember = DataPortal.Create(Of MyGroupMember)(New Criteria(memberId))
        If obj._userId = "" Then
            Return Nothing
        End If
        Return obj
    End Function

    Friend Shared Function GetGroupMember(ByVal dr As Csla.Data.SafeDataReader) As MyGroupMember
        Return New MyGroupMember(dr)
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
                cm.CommandText = "SELECT userId, userName, userDesc FROM mUser WHERE userId = @userId"
                cm.Parameters.AddWithValue("@userId", criteria.Id)

                Using dr As New SafeDataReader(cm.ExecuteReader)
                    If dr.Read() Then
                        Fetch(dr)
                    End If
                End Using

            End Using
        End Using
    End Sub

    Private Sub Fetch(ByVal dr As Csla.Data.SafeDataReader)
        _userId = dr.GetString("userId")
        _userName = dr.GetString("userName")
        _userDesc = dr.GetString("userDesc")

        MarkOld()
    End Sub

    Friend Sub Insert(ByVal tr As SqlTransaction, ByVal parent As MyGroup)
        If Me.IsDirty Then
            Using cm As New SqlCommand
                cm.Transaction = tr
                cm.Connection = tr.Connection

                cm.CommandType = CommandType.Text
                cm.CommandText = "INSERT INTO mUserGroup (userId, groupId) VALUES (@userId, @groupId)"

                cm.Parameters.AddWithValue("@userId", _userId)
                cm.Parameters.AddWithValue("@groupId", parent.GroupId)

                cm.ExecuteNonQuery()
                MarkOld()
            End Using
        End If
    End Sub

    Friend Sub DeleteSelf(ByVal parent As MyGroup)
        If Me.IsDirty AndAlso Not Me.IsNew Then
            Using cn As New SqlConnection(Database.DinnerDash)
                cn.Open()
                Using cm As SqlCommand = cn.CreateCommand
                    cm.CommandType = CommandType.Text
                    cm.CommandText = "DELETE mUserGroup WHERE (userId = @userId) AND (groupId = @groupId)"

                    cm.Parameters.AddWithValue("@userId", _userId)
                    cm.Parameters.AddWithValue("@groupId", parent.GroupId)

                    cm.ExecuteNonQuery()
                    MarkNew()
                End Using
            End Using
        End If
    End Sub

#End Region

End Class

