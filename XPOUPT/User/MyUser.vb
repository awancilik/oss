<Serializable()> Public Class MyUser
    Inherits BusinessBase(Of MyUser)

#Region " Business Methods "

    Private _userId As String = ""
    Private _userName As String = ""
    Private _userPassword As MyPassword = MyPassword.Empty
    Private _userDesc As String = ""

    Public Property UserId() As String
        Get
            Return _userId
        End Get
        Set(ByVal value As String)
            If Not value.Equals(_userId) Then
                _userId = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property UserName() As String
        Get
            Return _userName
        End Get
        Set(ByVal value As String)
            If Not value.Equals(_userName) Then
                _userName = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property UserPassword() As MyPassword
        Get
            Return _userPassword
        End Get
        Set(ByVal value As MyPassword)
            If Not value.Equals(_userPassword) Then
                _userPassword = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property UserDesc() As String
        Get
            Return _userDesc
        End Get
        Set(ByVal value As String)
            If Not value.Equals(_userDesc) Then
                _userDesc = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return _userId
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function NewUser() As MyUser
        Return DataPortal.Create(Of MyUser)()
    End Function

    Public Shared Function GetUser(ByVal id As String) As MyUser
        Dim obj As MyUser = DataPortal.Fetch(Of MyUser)(New Criteria(id))
        If String.IsNullOrEmpty(obj.UserId) Then
            Return Nothing
        End If
        Return obj
    End Function

    Public Shared Sub DeleteUser(ByVal id As String)
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

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                With cm
                    .CommandType = CommandType.Text
                    .CommandText = "SELECT userId, userName, userPassword, userDesc FROM mUser where userId = @userId"

                    .Parameters.AddWithValue("@userId", criteria.Id)

                    Using dr As New SafeDataReader(.ExecuteReader)
                        If dr.Read Then
                            Me.DataPortal_Fetch(dr)
                        End If
                    End Using
                End With
            End Using
        End Using
    End Sub

    Private Overloads Sub DataPortal_Fetch(ByVal dr As SafeDataReader)
        With dr
            _userId = .GetString("userId")
            _userName = .GetString("userName")
            '_userPassword = MyPassword.NewPassword(.GetString("userPassword"))
            _userDesc = .GetString("userDesc")
        End With
    End Sub

    <RunLocal()> _
    Protected Overrides Sub DataPortal_Create()
        _userPassword = MyPassword.NewPassword(GetDefaultPassword)
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
                            .CommandText = "UPDATE mUser SET userName = @userName, " & _
                                "userDesc = @userDesc " & _
                                "WHERE userId = @userId"


                            Me.DoInsertUpdate(cm)

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

    Protected Overrides Sub DataPortal_Insert()
        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As New SqlCommand
                With cm
                    Using tr As SqlTransaction = cn.BeginTransaction(IsolationLevel.Serializable)
                        Try
                            .Connection = tr.Connection
                            .Transaction = tr
                            .CommandType = CommandType.Text
                            .CommandText = "INSERT INTO mUser (userId, userName, userPassword, userDesc) " & _
                                            "VALUES (@userId, @userName, @userPassword, @userDesc)"

                            Me.DoInsertUpdate(cm)

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
            .Parameters.AddWithValue("@userId", _userId)
            .Parameters.AddWithValue("@userName", _userName)
            .Parameters.AddWithValue("@userPassword", _userPassword.DbValue)
            .Parameters.AddWithValue("@userDesc", _userDesc)

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
                            .CommandText = "DELETE FROM mUser WHERE userId = @userId"
                            .Parameters.AddWithValue("@userId", criteria.Id)

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
