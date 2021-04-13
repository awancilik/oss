Option Explicit On
Option Strict On

Imports CrystalDecisions.Web
Imports CrystalDecisions.Shared
Imports System.Configuration.ConfigurationManager
Imports System.Collections

Partial Class IPIPetikan
    Inherits ReportPageBase
    Private Const CONNECTION_STRING As String = "Report"
    Private Const REPORT_FILE_NAME As String = "report\source\IPI\Petikan.rpt"

    <Serializable()> Public Class Parameters
        Inherits ParametersBase(Of Parameters)

        Private _noPermohonan As String = ""
        Private _kapasitas As String = ""
        Private _kki As String = ""

        Public ReadOnly Property NoPermohonan() As String
            Get
                Return _noPermohonan
            End Get
        End Property

        Public ReadOnly Property KKI() As String
            Get
                Return _kki
            End Get
        End Property

        Public ReadOnly Property Kapasitas() As String
            Get
                Return _kapasitas
            End Get
        End Property

        Private Sub New()
            'Prevent Direct Creation
        End Sub

        Public Sub New(ByVal nopermohonan As String, ByVal kki As String, ByVal kapasitas As String)
            _noPermohonan = nopermohonan
            _kki = kki
            _kapasitas = kapasitas
        End Sub

        Protected Overrides Function CreateQueryStringValue(ByVal parameter As String) As String
            Select Case parameter
                Case "NoPermohonan"
                    Return Me.NoPermohonan
                Case "KKI"
                    Return Me.KKI
                Case "Kapasitas"
                    Return Me.Kapasitas
            End Select
            Return ""
        End Function

        Protected Overrides ReadOnly Property PageFileName() As String
            Get
                Return "../../reportPage/IPI/Petikan.aspx"
            End Get
        End Property

        Protected Overrides ReadOnly Property ParameterNames() As String()
            Get
                Dim result As String() = {"NoPermohonan", "KKI", "Kapasitas"}
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
                Case "KKI"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._kki = value
                        Return True
                    End If
                Case "Kapasitas"
                    If Not String.IsNullOrEmpty(value) Then
                        Me._kapasitas = value
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

    Protected Sub MonthlyStockReportSource_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles PetikanIPIReportSource.Init
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
        Dim rs As CrystalReportSource = DirectCast(PetikanIPIReportSource, CrystalReportSource)

        rs.ReportDocument.SetParameterValue("NoPermohonan", parameters.NoPermohonan)
        rs.ReportDocument.SetParameterValue("KKI", parameters.KKI)
        rs.ReportDocument.SetParameterValue("Kapasitas", parameters.Kapasitas)

        Me.PetikanIPIReportViewer.ReportSource = rs
        Me.PetikanIPIReportViewer.RefreshReport()
    End Sub

End Class
