Option Explicit On
Option Strict On

<Serializable()> _
Public Class Counter
    Inherits Csla.BusinessBase(Of Counter)

#Region " Business Methods "

    Private _kode As String = ""
    Private _prefix As String = ""
    Private _sufix As String = ""
    Private _counter As Decimal = 0
    Private _year As Decimal = 0
    Private _month As Decimal = 0

    Public Property Kode() As String
        Get
            Return _kode
        End Get
        Set(ByVal value As String)
            If Not value.Equals(_kode) Then
                _kode = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Sufix() As String
        Get
            Return _sufix
        End Get
        Set(ByVal value As String)
            If Not value.Equals(_sufix) Then
                _sufix = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Prefix() As String
        Get
            Return _prefix
        End Get
        Set(ByVal value As String)
            If Not value.Equals(_prefix) Then
                _prefix = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Counter() As Decimal
        Get
            Return _counter
        End Get
        Set(ByVal value As Decimal)
            If Not value.Equals(_counter) Then
                _counter = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Year() As Decimal
        Get
            Return _year
        End Get
        Set(ByVal value As Decimal)
            If Not value.Equals(_year) Then
                _year = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property Month() As Decimal
        Get
            Return _month
        End Get
        Set(ByVal value As Decimal)
            If Not value.Equals(_month) Then
                _month = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return _kode
    End Function

#End Region

#Region " Factory Methods "

    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Shared Function CreateNo(ByVal kode As String) As String
        Dim obj As Counter = DataPortal.Fetch(Of Counter)(New Criteria(kode, False))
        Dim month As Integer = Date.Today.Month
        Dim year As Integer = Date.Today.Year
        If String.IsNullOrEmpty(obj.Kode) Then
            Dim counter As Integer = 1
            If month < 10 Then
                CreateNo = year.ToString & "0" & month.ToString & "0001"
            Else
                CreateNo = year.ToString & month.ToString & "0001"
            End If
            Dim objReset As Counter = DataPortal.Fetch(Of Counter)(New Criteria(kode, True))
            objReset.Counter = 1
            objReset.Year = year
            objReset.Month = month
            objReset.Save()
        Else
            Dim CounterString As String = ""
            If obj.Counter < 9 Then
                CounterString = "000" & obj.Counter + 1
            ElseIf obj.Counter < 99 Then
                CounterString = "00" & obj.Counter + 1
            ElseIf obj.Counter < 999 Then
                CounterString = "0" & obj.Counter + 1
            End If
            If month < 10 Then
                CreateNo = year.ToString & "0" & month.ToString & CounterString
            Else
                CreateNo = year.ToString & month.ToString & CounterString
            End If

            obj.Counter = obj.Counter + 1
            obj.Year = year
            obj.Month = month
            obj.Save()
        End If
        Return CreateNo
    End Function

    Private Shared Function GetLastCounter(ByVal kode As String, ByVal reset As Boolean) As Counter
        Dim obj As Counter = DataPortal.Fetch(Of Counter)(New Criteria(kode, False))
        If String.IsNullOrEmpty(obj.Kode) Then
            Return Nothing
        End If
        Return obj
    End Function

#End Region

#Region " Data Access "

    <Serializable()> Private Class Criteria
        Private _kode As String = ""
        Private _reset As Boolean = False

        Public ReadOnly Property Kode() As String
            Get
                Return _kode
            End Get
        End Property

        Public ReadOnly Property Reset() As Boolean
            Get
                Return _reset
            End Get
        End Property

        Public Sub New(ByVal kode As String, ByVal reset As Boolean)
            _kode = Trim(kode)
            _reset = reset
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)
        Dim database As String = System.Configuration.ConfigurationManager.ConnectionStrings("Data").ConnectionString
        Using cn As New SqlConnection(database)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                With cm
                    If criteria.Reset = False Then
                        .CommandType = CommandType.Text
                        .CommandText = "SELECT * FROM Counter WHERE kode = @kode And year = @year and month = @month"

                        .Parameters.AddWithValue("@kode", criteria.Kode)
                        .Parameters.AddWithValue("@year", Date.Today.Year)
                        .Parameters.AddWithValue("@month", Date.Today.Month)

                        Using dr As New SafeDataReader(.ExecuteReader)
                            If dr.Read Then
                                Me.DataPortal_Fetch(dr)
                            End If
                        End Using
                    ElseIf criteria.Reset = True Then
                        .CommandType = CommandType.Text
                        .CommandText = "SELECT * FROM Counter WHERE kode = @kode"

                        .Parameters.AddWithValue("@kode", criteria.Kode)

                        Using dr As New SafeDataReader(.ExecuteReader)
                            If dr.Read Then
                                Me.DataPortal_Fetch(dr)
                            End If
                        End Using

                    End If
                End With
            End Using
        End Using
    End Sub

    Private Overloads Sub DataPortal_Fetch(ByVal dr As SafeDataReader)
        With dr
            Me._kode = .GetString("kode")
            Me._prefix = .GetString("prefix")
            Me._sufix = .GetString("sufix")
            Me._counter = .GetDecimal("counter")
            Me._year = .GetInt32("year")
            Me._month = .GetInt32("month")
        End With
    End Sub

    Protected Overrides Sub DataPortal_Update()
        Dim database As String = System.Configuration.ConfigurationManager.ConnectionStrings("Data").ConnectionString
        Using cn As New SqlConnection(database)
            cn.Open()
            Using cm As New SqlCommand
                With cm
                    Using tr As SqlTransaction = cn.BeginTransaction(IsolationLevel.Serializable)
                        .Connection = tr.Connection
                        .Transaction = tr
                        .CommandType = CommandType.Text
                        .CommandText = "UPDATE Counter SET Prefix = @prefix, Sufix = @sufix, Counter = @counter, " & _
                        "year = @year, month = @month WHERE kode = @kode"

                        Try
                            Dataportal_DoInsertUpdate(cm)
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

    Private Function Dataportal_DoInsertUpdate(ByVal cm As SqlCommand) As Integer
        Dim rowsAffected As Integer = 0
        With cm
            .Parameters.AddWithValue("@kode", Me._kode)
            .Parameters.AddWithValue("@sufix", Me._sufix)
            .Parameters.AddWithValue("@prefix", Me._prefix)
            .Parameters.AddWithValue("@counter", Me._counter)
            .Parameters.AddWithValue("@year", Me._year)
            .Parameters.AddWithValue("@month", Me._month)

            rowsAffected = .ExecuteNonQuery
        End With
        Return rowsAffected
    End Function

#End Region

End Class
