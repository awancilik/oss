Option Explicit On
Option Strict On
Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections

Partial Class rKeputusanSementara
    Inherits ReportPageBase

    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\source\IMB\KeputusanSementara.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _noIjinSementara As String = ""

        Public ReadOnly Property NoIjinSementara() As String
            Get
                Return _noIjinSementara
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal noijin As String)
            _noIjinSementara = noijin
        End Sub

        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "NoIjinSementara"
                    Return CStr(Me.NoIjinSementara)
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../../../report/reportPage/IMB/KeputusanSementara.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"NoIjinSementara"}
                Return result
            End Get
        End Property

        Protected Overrides Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean
            Select Case parameter
                Case "NoIjinSementara"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._noIjinSementara = value
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

    Protected Sub NoIjinSementara_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles KeputusanSementara.Init
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
        Dim rs As CrystalReportSource = DirectCast(KeputusanSementara, CrystalReportSource)

        For Each par As CrystalDecisions.Shared.ParameterField In rs.ReportDocument.ParameterFields
            par.CurrentValues.Clear()
            Dim newValue As ParameterDiscreteValue = New ParameterDiscreteValue
            newValue.Value = parameters.NoIjinSementara
            par.CurrentValues.Add(newValue)
        Next
        'rs.ReportDocument.SetParameterValue("NoIjinSementara", parameters.NoIjinSementara)

        Me.KeputusanSementaraReportViewer.ReportSource = rs
        Me.KeputusanSementaraReportViewer.RefreshReport()
    End Sub
End Class
