Option Explicit On
Option Strict On

Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections
Partial Class rpPetikanSementara
    Inherits ReportPageBase

    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\source\IMB\PetikanSementara.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _NoPetikanSementara As String = ""

        Public ReadOnly Property NoPetikanSementara() As String
            Get
                Return _NoPetikanSementara
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal NoPetikanSementara As String)
            _NoPetikanSementara = NoPetikanSementara
        End Sub

        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "_NoPetikanSementara"
                    Return CStr(Me.NoPetikanSementara)
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../../../report/reportPage/IMB/rpPetikanSementara.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"PetikanSementara"}
                Return result
            End Get
        End Property

        Protected Overrides Function ParseParameterValue(ByVal parameter As String, ByVal value As String) As Boolean
            Select Case parameter
                Case "_NoPetikanSementara"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._NoPetikanSementara = value
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

    Protected Sub PetikanSementara_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles PetikanSementara.Init
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
        Dim rs As CrystalReportSource = DirectCast(PetikanSementara, CrystalReportSource)

        rs.ReportDocument.SetParameterValue("NoPetikanSementara", parameters.NoPetikanSementara)

        Me.PetikanSementaraViewer.ReportSource = rs
        Me.PetikanSementaraViewer.RefreshReport()
    End Sub

End Class

