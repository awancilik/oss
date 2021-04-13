Imports System.Security
Imports System.Security.Cryptography

<Serializable()> Public Structure MyPassword

    Private Const MAX_PASSWORD_TXT_LEN As Integer = 16
    Private Const SALT_SIZE As Integer = 6
    Private Const SALT_STRING_LEN As Integer = 2 * SALT_SIZE

    Private _hash As String
    Private _salt As String

    <NonSerialized()> Public Shared ReadOnly Empty As MyPassword

#Region " Helper Functions "

    Public Shared ReadOnly Property MaxTextPasswordLength() As Integer
        Get
            Return MAX_PASSWORD_TXT_LEN
        End Get
    End Property

    Public ReadOnly Property DbValue() As Object
        Get
            If _hash Is Nothing Then
                Return System.DBNull.Value
            Else
                Return Me.ToString
            End If
        End Get
    End Property

    Public Shared Function IsValidTextPassword(ByVal txt As String) As Boolean
        If txt.Length > MaxTextPasswordLength Then
            Return False
        Else
            For index As Integer = 0 To txt.Length - 1
                If Not (Char.IsLetter(txt, index) OrElse Char.IsNumber(txt, index)) Then
                    Return False
                End If
            Next
        End If

        Return True
    End Function

    Public Shared Sub ValidateTextPassword(ByVal txt As String)
        If Not txt Is Nothing Then
            If Not IsValidTextPassword(txt) Then
                'Throw New InvalidPasswordFormatException
            End If
        End If
    End Sub

#End Region

#Region " Factory Methods "

    Public Sub New(ByVal txt As String, ByVal reference As MyPassword)
        If txt Is Nothing OrElse txt.Length = 0 Then
            'Do nothing, as if it is empty password
        ElseIf MyPassword.IsValidTextPassword(txt) Then
            If reference.Equals(MyPassword.Empty) Then
                _salt = CreateSalt(SALT_SIZE)
            Else
                _salt = reference._salt
            End If
            _hash = CalculateHash(_salt, txt)
        Else
            'Throw New InvalidPasswordFormatException
        End If
    End Sub
    Public Sub New(ByVal txt As String)
        Me.New(txt, MyPassword.Empty)
    End Sub

    Shared Function NewPassword(ByVal txt As String) As MyPassword
        Return New MyPassword(txt)
    End Function
    Shared Function NewPassword(ByVal txt As String, ByVal reference As MyPassword) As MyPassword
        Return New MyPassword(txt, reference)
    End Function

    Shared Function Parse(ByVal s As String) As MyPassword
        If s Is Nothing OrElse s.Length = 0 Then
            Return MyPassword.Empty
        ElseIf s.Length < SALT_STRING_LEN Then
            Throw New ArgumentOutOfRangeException("s")
        Else
            Dim h As MyPassword
            With h
                ._salt = s.Substring(0, SALT_STRING_LEN)
                ._hash = s.Substring(SALT_STRING_LEN)
            End With
            Return h
        End If
    End Function

#End Region

#Region " System.Object "

    Public Overrides Function ToString() As String
        Return _salt & _hash
    End Function

    Public Overloads Function Equals(ByVal value As MyPassword) As Boolean
        If _hash Is Nothing Then
            If value._hash Is Nothing Then
                Return True
            Else
                Return False
            End If
        Else
            If value._hash Is Nothing Then
                Return False
            Else
                Return _hash.Equals(value._hash)
            End If
        End If
    End Function

#End Region

#Region " Crypto Routine "

    Private Shared Function CreateSalt(ByVal size As Integer) As String
        Dim r() As Byte = CreateRandomBytes(size)
        Return Convert.ToBase64String(r)
    End Function

    Private Shared Function CreateRandomBytes(ByVal len As Integer) As Byte()
        Dim r(len) As Byte
        RNGCryptoServiceProvider.Create().GetBytes(r)
        Return r
    End Function

    Private Shared Function CalculateHash(ByVal salt As String, ByVal text As String) As String
        Dim data() As Byte = ToByteArray(salt & text)
        Dim hash() As Byte = CalculateHash(data)
        Return Convert.ToBase64String(hash)
    End Function
    Private Shared Function CalculateHash(ByVal data() As Byte) As Byte()
        Return SHA1CryptoServiceProvider.Create.ComputeHash(data)
    End Function

    Private Shared Function ToByteArray(ByVal s As String) As Byte()
        Return System.Text.Encoding.UTF8.GetBytes(s)
    End Function

#End Region

End Structure
