Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_IMBSerahTerima
    Inherits System.Web.UI.Page

    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        imbXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            CheckIMB(objPermohonan)
            permohonanDetailsView.DataBind()
        Else
            Session("PermohonanID") = Nothing
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Private Sub CheckIMB(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("permohonanID.PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objIMB As IMB = DirectCast(session1.FindObject(GetType(IMB), criteria), IMB)
        If objIMB IsNot Nothing Then
            Session("IMBID") = objIMB.IMBID
            IzinDetailsView.DataBind()
            IzinSementaraIMBDetailsView.DataBind()
            ipbDetailsView.DataBind()
        Else
            Session("IMBID") = Nothing
            IzinDetailsView.DataBind()
            IzinSementaraIMBDetailsView.DataBind()
            ipbDetailsView.DataBind()
            notFoundASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub

End Class
