Option Explicit On
Option Strict On

Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections

Partial Class IPIJmlIzinReport
    Inherits ReportPageBase

    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\source\IPI\daftarbulanan.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _Bulan As Integer = 0
        Private _Tahun As Integer = 0

        Public ReadOnly Property Bulan() As Integer
            Get
                Return _Bulan
            End Get
        End Property

        Public ReadOnly Property Tahun() As Integer
            Get
                Return _Tahun
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal Bulan As Integer, ByVal Tahun As Integer)
            _Bulan = Bulan
            Me._Tahun = Tahun
        End Sub

        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "Bulan"
                    Return CStr(Me.Bulan)
                Case "Tahun"
                    Return CStr(Me.Tahun)
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../../../report/reportPage/IPI/JmlIzin.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"Bulan", "Tahun"}
                Return result
            End Get
        End Property

        Protected Overrides Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean
            Select Case parameter
                Case "Bulan"
                    If Not String.IsNullOrEmpty(CStr(value)) Then
                        Me._Bulan = CInt(value)
                        Return True
                    End If
                Case "Tahun"
                    If Not String.IsNullOrEmpty(CStr(value)) Then
                        Me._Tahun = CInt(value)
                        Return True
                    End If
            End Select
        End Function
    End Class

    Protected Overrides ReadOnly Property ConnectionString() As String
        Get
            Return ConnectionStrings(CONNECTION_STRING).ConnectionString
        End Get
    End Property

    Protected Overrides ReadOnly Property CrystalReportFileName() As String
        Get
            Return Request.PhysicalApplicationPath & REPORT_FILE_NAME
        End Get
    End Property

    Protected Sub IPIJmlIzin_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles IPIJmlIzin.Init
        InitCrystalReportSource(DirectCast(sender, CrystalReportSource))
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim p As Parameters = Parameters.Parse
        If p Is Nothing Then
            'ToDo: Show error
        Else
            RefreshReport(p)
        End If
    End Sub

    Private Sub RefreshReport(ByVal parameters As Parameters)
        Dim rs As CrystalReportSource = DirectCast(IPIJmlIzin, CrystalReportSource)

        rs.ReportDocument.SetParameterValue("Bulan", parameters.Bulan)
        rs.ReportDocument.SetParameterValue("Tahun", parameters.Tahun)

        Me.IPIJmlIzinReportViewer.ReportSource = rs
        Me.IPIJmlIzinReportViewer.RefreshReport()
    End Sub
End Class
