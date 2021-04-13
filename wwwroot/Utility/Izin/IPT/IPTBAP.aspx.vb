Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_IPTBAP
    Inherits System.Web.UI.Page

    Dim session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IPTBAPXpoDataSource.Session = session1
        permohonanXpoDataSource.Session = session1
        IPTPemeriksaanXpoDataSource.Session = session1
        IPTPemeriksaanDetailXpoDataSource.Session = session1
        timPemeriksaXpoDataSource.Session = session1
        IPTBAPDetailXpoDataSource.Session = session1
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
            CheckIPT(objPermohonan)
            CheckPemeriksaan()
            If CheckBAP() Then
                buatBAPASPxButton.Visible = False
            Else
                buatBAPASPxButton.Visible = True
            End If
            permohonanDetailsView.DataBind()
        Else
            Session("PermohonanID") = Nothing
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Private Sub CheckIPT(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), criteria), IPT)
        If objIPT IsNot Nothing Then
            Session("IPTID") = objIPT.IPTID
        Else
            Session("IPTID") = Nothing
        End If
    End Sub

    Private Function CheckPemeriksaan() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objPemeriksaan As IPTPemeriksaan = DirectCast(session1.FindObject(GetType(IPTPemeriksaan), criteria), IPTPemeriksaan)
        If objPemeriksaan IsNot Nothing Then
            Session("IPTPemeriksaanID") = objPemeriksaan.IPTPemeriksaanID
            Return True
        Else
            Session("IPTPemeriksaanID") = Nothing
            notFoundASPxPopupControl.ShowOnPageLoad = True
            Return False
        End If
    End Function

    Private Function CheckBAP() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objBAP As IPTBAP = DirectCast(session1.FindObject(GetType(IPTBAP), criteria), IPTBAP)
        If objBAP IsNot Nothing Then
            Session("IPTBAPID") = objBAP.IPTBAPID
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub buatBAPASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buatBAPASPxButton.Click
        IPTBAPDetailsView.ChangeMode(DetailsViewMode.Insert)
        buatBAPASPxButton.Visible = False
    End Sub

    Protected Sub IPTBAPDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles IPTBAPDetailsView.ItemInserted
        If CheckBAP() Then
            buatBAPASPxButton.Visible = False
        Else
            buatBAPASPxButton.Visible = True
        End If
    End Sub

    Protected Sub IPTBAPDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles IPTBAPDetailsView.ItemInserting
        'e.Values.Item("PermohonanID") = Session("PermohonanID")
        'e.Values.Item("IPTID") = Session("IPTID")
        'e.Values.Item("IPTPemeriksaanID") = Session("IPTPemeriksaanID")
        Dim pemohonid As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & Session("PermohonanID").ToString & "'")
        Dim ipid As CriteriaOperator = CriteriaOperator.Parse("IPTID='" & Session("IPTID").ToString & "'")
        Dim pemeriksaanid As CriteriaOperator = CriteriaOperator.Parse("IPTPemeriksaanID='" & Session("IPTPemeriksaanID").ToString & "'")
        e.Values.Item("PermohonanID") = DirectCast(session1.FindObject(GetType(Permohonan), pemohonid), Permohonan)
        e.Values.Item("IPTID") = DirectCast(session1.FindObject(GetType(IPT), pemohonid), IPT)
        e.Values.Item("IPTPemeriksaanID") = DirectCast(session1.FindObject(GetType(IPTPemeriksaan), pemeriksaanid), IPTPemeriksaan)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("IPTID") = Nothing
            Session("IPTPemeriksaanID") = Nothing
        End If
    End Sub

    Protected Sub IPTBAPDetailASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPTBAPID!Key") = Session("IPTBAPID")
    End Sub
End Class
