Public Class MyRoleInfo
    Inherits Csla.ReadOnlyBase(Of MyRoleInfo)

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

    Public Shared Function GetRoleInfo(ByVal dr As SafeDataReader) As MyRoleInfo
        Return New MyRoleInfo(dr)
    End Function

    Private Sub New(ByVal dr As Csla.Data.SafeDataReader)
        DataPortal_Fetch(dr)
    End Sub

    Public Shared Function GetRoleInfo(ByVal id As String) As MyRoleInfo
        Dim obj As MyRoleInfo = DataPortal.Fetch(Of MyRoleInfo)(New Criteria(id))
        'TODO check if id is empty or not
        If obj.RoleId = "" Then
            Return Nothing
        End If
        Return obj
    End Function

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
                cm.CommandText = "SELECT roleId, roleTitle FROM mRole WHERE roleId = @roleId"
                cm.Parameters.AddWithValue("@roleId", criteria.Id)

                Using dr As New SafeDataReader(cm.ExecuteReader)
                    If dr.Read Then
                        _roleId = dr.GetString("roleId").Trim
                        _roleTitle = dr.GetString("roleTitle").Trim
                    End If
                End Using
            End Using
        End Using
    End Sub

    Private Overloads Sub DataPortal_Fetch(ByVal dr As SafeDataReader)
        With dr
            _roleId = .GetString("roleId")
            _roleTitle = .GetString("roleTitle")
        End With
    End Sub

#End Region

End Class
