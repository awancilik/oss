Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_LokasiPemeriksaan
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        lokasiPemeriksaanXpoDataSource.Session = session1
        lokasiPemeriksaanDetailXpoDataSource.Session = session1
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
            CheckLokasi(objPermohonan)
            If CheckPemeriksaan() Then
                bikinASPxButton.Visible = False
            Else
                bikinASPxButton.Visible = True
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
            Return False
        End If
    End Function

    Protected Sub bikinASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bikinASPxButton.Click
        lokasiPemeriksaanDetailsView.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub imbPemeriksaanDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles lokasiPemeriksaanDetailsView.ItemInserted
        If CheckPemeriksaan() Then
            bikinASPxButton.Visible = False
        Else
            bikinASPxButton.Visible = True
        End If
    End Sub

    Protected Sub lokasiPemeriksaanDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles lokasiPemeriksaanDetailsView.ItemInserting
        e.Values.Item("PermohonanID") = Session("PermohonanID")
        e.Values.Item("LokasiID") = Session("LokasiID")
    End Sub

    Protected Sub lokasiPemeriksaanDetailASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("LokasiPemeriksaanID!Key") = Session("LokasiPemeriksaanID")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("LokasiID") = Nothing
            Session("LokasiPemeriksaanID") = Nothing
        End If
    End Sub

End Class
