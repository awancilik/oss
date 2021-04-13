Option Explicit On
Option Strict On

Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections

Partial Class TDIKeputusan
    Inherits ReportPageBase
    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\source\TDI\Keputusan.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _noPermohonan As String = ""
        Private _Pembantu As String = ""
        Private _jenisUsahaNama As String = ""

        Public ReadOnly Property JenisUsahaNama() As String
            Get
                Return _jenisUsahaNama
            End Get
        End Property

        Public ReadOnly Property Pembantu() As String
            Get
                Return _Pembantu
            End Get
        End Property

        Public ReadOnly Property NoPermohonan() As String
            Get
                Return _noPermohonan
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal nopermohonan As String, ByVal pembantu As String, ByVal jenisusahanama As String)
            _noPermohonan = nopermohonan
            _Pembantu = pembantu
            _jenisUsahaNama = jenisusahanama
        End Sub


        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "NoPermohonan"
                    Return Me.NoPermohonan
                Case "Pembantu"
                    Return Me.Pembantu
                Case "JenisUsahaNama"
                    Return Me.JenisUsahaNama
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../../reportPage/TDI/Keputusan.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"NoPermohonan", "Pembantu", "JenisUsahaNama"}
                Return result
            End Get
        End Property

        Protected Overrides Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean
            Select Case parameter
                Case "NoPermohonan"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._noPermohonan = value
                        Return True
                    End If
                Case "Pembantu"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._Pembantu = value
                        Return True
                    End If
                Case "JenisUsahaNama"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._jenisUsahaNama = value
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

    Protected Sub MonthlyStockReportSource_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles KeputusanIzinTDIReportSource.Init
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
        Dim rs As CrystalReportSource = DirectCast(KeputusanIzinTDIReportSource, CrystalReportSource)
        rs.ReportDocument.SetParameterValue("NoPermohonan", parameters.NoPermohonan)
        rs.ReportDocument.SetParameterValue("Pembantu", parameters.Pembantu)
        rs.ReportDocument.SetParameterValue("JenisUsahaNama", parameters.JenisUsahaNama)
        Me.KeputusanIzinTDIReportViewer.ReportSource = rs
        Me.KeputusanIzinTDIReportViewer.RefreshReport()
    End Sub

End Class
