Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_IPT_IPTSerahTerima
    Inherits System.Web.UI.Page
    Private session1 As Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        IPTXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
    Protected Sub cariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cariASPxButton.Click
        Dim nopermohonan As String = cariNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & nopermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            CekIPT(objPermohonan)
            ASPDetailViewSerahTerima.DataBind()
        Else
            Session("PermohonanID") = Nothing
            ASPDetailViewSerahTerima.DataBind()
        End If
    End Sub
    Protected Sub CekIPT(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & Session("PermohonanID").ToString & "'")
        Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), criteria), IPT)
        If objIPT IsNot Nothing Then
            Session("IPTID") = objIPT.IPTID
            IzinDetailsView.DataBind()
        Else
            Session("IPTID") = Nothing
            IzinDetailsView.DataBind()
            ASPxPopupControlnotfound.ShowOnPageLoad = True
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("IPTID") = Nothing
        End If
    End Sub
End Class
