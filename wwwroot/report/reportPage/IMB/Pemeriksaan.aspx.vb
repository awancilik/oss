Option Explicit On
Option Strict On
Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections
Partial Class Pemeriksaan
    Inherits ReportPageBase

    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\source\IMB\IMBPemeriksaan.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _tanggal As Date = Date.Now
        Private _pemeriksaid As Guid = Guid.Empty

        Public ReadOnly Property Tanggal() As Date
            Get
                Return _tanggal
            End Get
        End Property
        Public ReadOnly Property PemeriksaID() As Guid
            Get
                Return _pemeriksaid
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal tanggal As Date, ByVal pemeriksaid As Guid)
            Me._tanggal = tanggal
            Me._pemeriksaid = pemeriksaid
        End Sub

        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "tgl"
                    Return CStr(Me._tanggal)
                Case "pemeriksaId"
                    Return Me._pemeriksaid.ToString
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../../../report/reportPage/IMB/Pemeriksaan.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"tgl", "pemeriksaId"}
                Return result
            End Get
        End Property

        Protected Overrides Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean
            Select Case parameter
                Case "tgl"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._tanggal = CDate(value)
                        Return True
                    End If
                Case "pemeriksaId"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._pemeriksaid = New Guid(value)
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

    Protected Sub Pemeriksaan_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles PemeriksaanReportSource.Init
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
        Dim rs As CrystalReportSource = DirectCast(PemeriksaanReportSource, CrystalReportSource)

        rs.ReportDocument.SetParameterValue("tgl", parameters.Tanggal)
        rs.ReportDocument.SetParameterValue("pemeriksaId", parameters.PemeriksaID.ToString)

        Me.PemeriksaanReportViewer.ReportSource = rs
        Me.PemeriksaanReportViewer.RefreshReport()
    End Sub
End Class
