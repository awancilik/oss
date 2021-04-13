<Serializable()> Public Class ChangePasswordCommand
    Inherits Csla.CommandBase

#Region " Client-side Code "

    Private _result As Boolean

    Public ReadOnly Property Result() As Boolean
        Get
            Return _result
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Private _username As String = ""
    Private _newPassword As String = ""
    Private _oldPassword As String = ""
    Private _validateOldPassword As Boolean = False

    Public Shared Function Execute(ByVal username As String, ByVal oldPassword As String, ByVal newPassword As String) As Boolean
        'Validate parameters
        MyPassword.ValidateTextPassword(newPassword)
        'Set parameters
        Dim cmd As New ChangePasswordCommand
        With cmd
            ._username = username
            ._oldPassword = oldPassword
            ._newPassword = newPassword
            ._validateOldPassword = True
        End With
        'Execute command
        cmd = Csla.DataPortal.Execute(Of ChangePasswordCommand)(cmd)
        Return cmd.Result
    End Function
    Public Shared Function Execute(ByVal username As String, ByVal newPassword As String) As Boolean
        'Validate parameters
        MyPassword.ValidateTextPassword(newPassword)
        'Set parameters
        Dim cmd As New ChangePasswordCommand
        With cmd
            ._username = username
            ._newPassword = newPassword
            ._validateOldPassword = False
        End With
        'Execute command
        cmd = Csla.DataPortal.Execute(Of ChangePasswordCommand)(cmd)
        Return cmd.Result
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()
        Dim newPwd As New MyPassword(_newPassword)
        Using cn As New SqlClient.SqlConnection(Database.DinnerDash)
            cn.Open()
            If _validateOldPassword Then
                Dim storedPwd As MyPassword = GetPassword(cn, _username)
                Dim givenPwd As New MyPassword(_oldPassword, storedPwd)
                If Not givenPwd.Equals(storedPwd) Then
                    Throw New System.Security.SecurityException("Kata sandi tidak benar")
                End If
            End If

            Dim tr As SqlClient.SqlTransaction = cn.BeginTransaction(IsolationLevel.Serializable)
            Try
                Using cm As SqlClient.SqlCommand = tr.Connection.CreateCommand
                    cm.Transaction = tr
                    cm.CommandType = CommandType.Text
                    cm.CommandText = "UPDATE mUser SET userPassword = @user_pwd WHERE (userId = @userId);"

                    cm.Parameters.AddWithValue("@userId", _username)
                    cm.Parameters.AddWithValue("@user_pwd", newPwd.DbValue)

                    _result = (cm.ExecuteNonQuery() > 0)
                End Using
                tr.Commit()
            Catch ex As Exception
                tr.Rollback()
                Throw ex
            End Try

        End Using
    End Sub

    Private Function GetPassword(ByVal cn As SqlClient.SqlConnection, ByVal userName As String) As MyPassword
        Dim pwd As MyPassword = MyPassword.Empty
        Using cm As SqlClient.SqlCommand = cn.CreateCommand
            cm.CommandType = CommandType.Text
            cm.CommandText = "SELECT userPassword FROM mUser WHERE (userId = @userId)"
            cm.Parameters.AddWithValue("@userId", userName)
            Dim s As String = CType(cm.ExecuteScalar, String)
            If Not String.IsNullOrEmpty(s) Then
                pwd = MyPassword.Parse(s)
            End If
        End Using
        Return pwd
    End Function

#End Region

End Class
