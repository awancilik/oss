Option Explicit On
Option Strict On
Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections

Partial Class PermohonanReport
    Inherits ReportPageBase

    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\reportPage\PermohonanPerijinan.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _NoPermohonan As String = ""

        Public ReadOnly Property NoPermohonan() As String
            Get
                Return _NoPermohonan
            End Get
        End Property

        Private _jenisIjin As String = ""

        Public ReadOnly Property jenisIjin() As String
            Get
                Return _jenisIjin
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal NoPermohonan As String, ByVal jenisIjinList As String)
            _NoPermohonan = NoPermohonan
            _jenisIjin = jenisIjinList
        End Sub

        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "NoPermohonan"
                    Return CStr(Me._NoPermohonan)
                Case "jenisIjin"
                    Return CStr(Me._jenisIjin)
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../report/reportPage/IMB/Permohonan.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"NoPermohonan", "jenisIjin"}
                Return result
            End Get
        End Property

        Protected Overrides Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean
            Select Case parameter
                Case "NoPermohonan"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._NoPermohonan = value
                        Return True
                    End If
                Case "jenisIjin"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._jenisIjin = value
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

    Protected Sub Permohonan_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Permohonan.Init
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
        Dim rs As CrystalReportSource = DirectCast(Permohonan, CrystalReportSource)

        rs.ReportDocument.SetParameterValue("NoPermohonan", parameters.NoPermohonan)
        rs.ReportDocument.SetParameterValue("jenisIjin", parameters.jenisIjin)

        Me.PermohonanReportViewer.ReportSource = rs
        Me.PermohonanReportViewer.RefreshReport()
    End Sub

End Class
