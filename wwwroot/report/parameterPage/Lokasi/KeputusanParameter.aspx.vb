Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports System
Partial Class report_LokasiParameter
    Inherits System.Web.UI.Page
    Private session1 As Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim noPermohonan As String = NoPermohonanTextBox.Text
        Dim ReportLokasi As New KeputusanLokasiReport.Parameters(noPermohonan)
        ReportLokasi.OpenReportInNewWindow()
    End Sub
End Class
