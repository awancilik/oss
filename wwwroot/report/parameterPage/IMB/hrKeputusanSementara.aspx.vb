Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Partial Class report_hrKeputusanSementara
    Inherits System.Web.UI.Page
    Private session1 As Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
    Protected Sub NoIjinSementaraButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoIjinSementaraButton.Click
        Dim _noIjinSementara As String = NoIjinSementaraTextBox.Text
        Dim rIjinSementara As New rKeputusanSementara.Parameters(_noIjinSementara)
        rIjinSementara.OpenReportInNewWindow()
        'Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NoIjinSementara='" & _noIjinSementara & "'")
        'Dim objIMB As IMB = TryCast(session1.FindObject(GetType(IMB), query1), IMB)
        'If objIMB IsNot Nothing Then
        '    Dim imbid As Guid = objIMB.IMBID
        '    Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanIzinID='" & imbid.ToString & "'")
        '    Dim objPD As PermohonanDetail = TryCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        '    Dim status As String = objPD.StatusPermohonan
        '    If status = "DITERIMA" Then
        '        rIjinSementara.OpenReportInNewWindow()
        '    Else
        '        WarningPopupControl.ShowOnPageLoad = True
        '    End If
        'Else
        '    WarningPopupControl.ShowOnPageLoad = True
        'End If
    End Sub
End Class
