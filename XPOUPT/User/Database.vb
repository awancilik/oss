Imports System.Configuration.ConfigurationManager
Imports System.Configuration

Friend Module Database

    Public ReadOnly Property DinnerDash() As String
        Get
            Return ConnectionStrings("Data").ConnectionString
        End Get
    End Property

    Public ReadOnly Property GetDefaultPassword() As String
        Get
            Dim s As String = ConfigurationManager.AppSettings.Item("DefaultUserPassword")
            If String.IsNullOrEmpty(s) Then
                s = "1234"
            End If
            Return s
        End Get
    End Property

End Module