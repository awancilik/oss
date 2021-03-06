Option Explicit On
Option Strict On

Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections

Partial Class IMBJmlIzinReport
    Inherits ReportPageBase

    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\source\IMB\IMBJmlIzin.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _startDate As Date = Date.Now
        Private _endDate As Date = Date.Now

        Public ReadOnly Property StartDate() As Date
            Get
                Return _startDate
            End Get
        End Property

        Public ReadOnly Property endDate() As Date
            Get
                Return _endDate
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal startDate As Date, ByVal endDate As Date)
            _startDate = startDate
            Me._endDate = endDate
        End Sub

        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "startDate"
                    Return CStr(Me.StartDate)
                Case "endDate"
                    Return CStr(Me.endDate)
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../../../report/reportPage/IMB/JmlIzin.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"startDate", "endDate"}
                Return result
            End Get
        End Property

        Protected Overrides Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean
            Select Case parameter
                Case "startDate"
                    If Not String.IsNullOrEmpty(CStr(value)) Then
                        Me._startDate = CDate(value)
                        Return True
                    End If
                Case "endDate"
                    If Not String.IsNullOrEmpty(CStr(value)) Then
                        Me._endDate = CDate(value)
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

    Protected Sub IMBJmlIzin_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles IMBJmlIzin.Init
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
        Dim rs As CrystalReportSource = DirectCast(IMBJmlIzin, CrystalReportSource)

        rs.ReportDocument.SetParameterValue("startDate", parameters.StartDate)
        rs.ReportDocument.SetParameterValue("endDate", parameters.endDate)

        Me.IMBJmlIzinReportViewer.ReportSource = rs
        Me.IMBJmlIzinReportViewer.RefreshReport()
    End Sub
End Class
