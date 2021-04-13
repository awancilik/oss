Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports System

Partial Class report_ReportPetikanKeputusan
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
        Dim noIjinIMB As String = NoIjinTextBox.Text
        Dim rpt As New IMBPetikanReport.Parameters(noIjinIMB)
        rpt.OpenReportInNewWindow()

        'Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NoIjin='" & noIjinIMB & "'")
        'Dim objIMB As IMB = TryCast(session1.FindObject(GetType(IMB), query1), IMB)
        'If objIMB IsNot Nothing Then
        '    Dim imbid As Guid = objIMB.IMBID
        '    Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanIzinID='" & imbid.ToString & "'")
        '    Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        '    If objPD.StatusPermohonan = "DITERIMA" Then
        '        Dim rpt As New IMBPetikanReport.Parameters(noIjinIMB)
        '        rpt.OpenReportInNewWindow()
        '    Else
        '        WarningPopupControl.ShowOnPageLoad = True
        '    End If
        'Else
        '    WarningPopupControl.ShowOnPageLoad = True
        'End If
    End Sub
End Class
