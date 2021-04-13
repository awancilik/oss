Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports System
Partial Class report_ReportIMB
    Inherits System.Web.UI.Page
    Private session1 As Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub CariNoIjinButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariNoIjinButton.Click
        Dim noPermohonan As String = NoIjinTextBox.Text
        Dim ReportKeputusan As New KeputusanReport.Parameters(noPermohonan)
        ReportKeputusan.OpenReportInNewWindow()
        'Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
        'Dim objP As Permohonan = TryCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        'If objP IsNot Nothing Then
        '    Dim permohonanid As Guid = objP.PermohonanID
        '    Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid.ToString & "'")
        '    Dim objPD As PermohonanDetail = TryCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        '    If Not String.IsNullOrEmpty(objPD.StatusPermohonan) Then
        '        Dim status As String = objPD.StatusPermohonan.Trim
        '        If status = "DITERIMA" Then
        '            ReportKeputusan.OpenReportInNewWindow()
        '        Else
        '            WarningPopupControl.ShowOnPageLoad = True
        '        End If
        '    End If
        'Else
        '    WarningPopupControl.ShowOnPageLoad = True
        'End If
    End Sub
End Class

