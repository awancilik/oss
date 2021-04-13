Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_LokasiBAP
    Inherits System.Web.UI.Page

    Dim session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        LokasiBAPXpoDataSource.Session = session1
        permohonanXpoDataSource.Session = session1
        LokasiPemeriksaanXpoDataSource.Session = session1
        LokasiPemeriksaanDetailXpoDataSource.Session = session1
        timPemeriksaXpoDataSource.Session = session1
        LokasiBAPDetailXpoDataSource.Session = session1
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
            CheckLokasi(objPermohonan)
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

    Private Sub CheckLokasi(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objLokasi As Lokasi = DirectCast(session1.FindObject(GetType(Lokasi), criteria), Lokasi)
        If objLokasi IsNot Nothing Then
            Session("LokasiID") = objLokasi.LokasiID
        Else
            Session("LokasiID") = Nothing
        End If
    End Sub

    Private Function CheckPemeriksaan() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objPemeriksaan As LokasiPemeriksaan = DirectCast(session1.FindObject(GetType(LokasiPemeriksaan), criteria), LokasiPemeriksaan)
        If objPemeriksaan IsNot Nothing Then
            Session("LokasiPemeriksaanID") = objPemeriksaan.LokasiPemeriksaanID
            Return True
        Else
            Session("LokasiPemeriksaanID") = Nothing
            notFoundASPxPopupControl.ShowOnPageLoad = True
            Return False
        End If
    End Function

    Private Function CheckBAP() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objBAP As LokasiBAP = DirectCast(session1.FindObject(GetType(LokasiBAP), criteria), LokasiBAP)
        If objBAP IsNot Nothing Then
            Session("LokasiBAPID") = objBAP.LokasiBAPID
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub buatBAPASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buatBAPASPxButton.Click
        LokasiBAPDetailsView.ChangeMode(DetailsViewMode.Insert)
        buatBAPASPxButton.Visible = False
    End Sub

    Protected Sub LokasiBAPDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles LokasiBAPDetailsView.ItemInserted
        If CheckBAP() Then
            buatBAPASPxButton.Visible = False
        Else
            buatBAPASPxButton.Visible = True
        End If
    End Sub

    Protected Sub LokasiBAPDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles LokasiBAPDetailsView.ItemInserting
        Dim pemohonid As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & Session("PermohonanID").ToString & "'")
        Dim lokasiid As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & Session("LokasiID").ToString & "'")
        Dim pemeriksaanid As CriteriaOperator = CriteriaOperator.Parse("LokasiPemeriksaanID='" & Session("LokasiPemeriksaanID").ToString & "'")
        e.Values.Item("PermohonanID") = DirectCast(session1.FindObject(GetType(Permohonan), pemohonid), Permohonan)
        e.Values.Item("LokasiID") = DirectCast(session1.FindObject(GetType(Lokasi), pemohonid), Lokasi)
        e.Values.Item("LokasiPemeriksaanID") = DirectCast(session1.FindObject(GetType(LokasiPemeriksaan), pemeriksaanid), LokasiPemeriksaan)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("LokasiID") = Nothing
            Session("LokasiPemeriksaanID") = Nothing
        End If
    End Sub

    Protected Sub lokasiBAPDetailASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("LokasiBAPID!Key") = Session("LokasiBAPID")
    End Sub
End Class
