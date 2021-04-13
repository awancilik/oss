Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_IUIPemeriksaan
    Inherits System.Web.UI.Page

    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        iuiPemeriksaanXpoDataSource.Session = session1
        iuiPemeriksaanDetailXpoDataSource.Session = session1
        timPemeriksaXpoDataSource.Session = session1
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
            If CheckPemeriksaan() Then
                bikinASPxButton.Visible = False
            Else
                bikinASPxButton.Visible = True
            End If
            permohonanDetailsView.DataBind()
        Else
            Session("PermohonanID") = Nothing
            Session("IUIID") = Nothing
            notFoundASPxPopupControl.ShowOnPageLoad = True
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Private Sub CheckIMB(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID.PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objIUI As IUI = DirectCast(session1.FindObject(GetType(IUI), criteria), IUI)
        If objIUI IsNot Nothing Then
            Session("IUIID") = objIUI.IUIID
        Else
            Session("IUIID") = Nothing
        End If
    End Sub

    Private Function CheckPemeriksaan() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objPemeriksaan As IUIPemeriksaan = DirectCast(session1.FindObject(GetType(IUIPemeriksaan), criteria), IUIPemeriksaan)
        If objPemeriksaan IsNot Nothing Then
            Session("IUIPemeriksaanID") = objPemeriksaan.IUIPemeriksaanID
            Return True
        Else
            Session("IUIPemeriksaanID") = Nothing

            Return False
        End If
    End Function

    Protected Sub bikinASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bikinASPxButton.Click
        imbPemeriksaanDetailsView.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub imbPemeriksaanDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles imbPemeriksaanDetailsView.ItemInserted
        If CheckPemeriksaan() Then
            bikinASPxButton.Visible = False
        Else
            bikinASPxButton.Visible = True
        End If
    End Sub

    Protected Sub imbPemeriksaanDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles imbPemeriksaanDetailsView.ItemInserting
        e.Values.Item("PermohonanID") = Session("PermohonanID")
        e.Values.Item("IUIID") = Session("IUIID")
    End Sub

    Protected Sub imbPemeriksaanDetailASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IUIPemeriksaanID!Key") = Session("IUIPemeriksaanID")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("IUIID") = Nothing
            Session("IUIPemeriksaanID") = Nothing
        End If
    End Sub

End Class
