Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Text
Imports DevExpress.Web.ASPxEditors
Imports System.Collections.Generic
Imports System.Web.Util
Imports DevExpress.Xpo.DB
Imports DevExpress.Web
Imports DevExpress.Web.Data
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.XtraReports.UI
Imports devexpress.Web.ASPxGridView.ASPxGridView
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_SIUP
    Inherits System.Web.UI.Page
    Private session1 As Session

#Region " Xpo "

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        SIUPXpoDataSource.Session = session1
        SIUPBankXpoDataSource.Session = session1
        MaksudXpoDataSource.Session = session1
        BentukXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        IzinXpoDataSource.Session = session1
        SIUPJenisKLUIlXpoDataSource.Session = session1
        KLUIXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("SIUPID") = Nothing
            Session("Status") = Nothing
            Session("Permohonan") = Nothing
        End If
    End Sub

#End Region

#Region " Cek Permohonan - PD - SIUP / Cek No Izin "

    Private Sub cariPermohonan()
        Dim permohonanid As Permohonan = session1.FindObject(Of Permohonan)(New BinaryOperator("NomorPermohonan", _
                                            MaksudASPxTextBox.Text.Trim))
        If permohonanid IsNot Nothing Then
            If cekPD(permohonanid) Then
                SIUPDetailView.Visible = True
                SIUPDetailView.ChangeMode(DetailsViewMode.Edit)
            Else
                SIUPDetailView.Visible = False
            End If
        Else
            SIUPDetailView.Visible = False
        End If
    End Sub

    Private Function cekPD(ByVal obj As Permohonan) As Boolean
        Dim status As String = Session("Status").ToString
        Dim PD As PermohonanDetail = session1.FindObject(Of PermohonanDetail)(New BinaryOperator( _
                                        "PermohonanID", obj.PermohonanID))
        If PD IsNot Nothing Then
            Dim Sifat As String = PD.JenisPermohonanIzinID.MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama.Trim
            If status = Sifat Then
                cekPD = cekSIUP(PD)
                If Not status = "Baru" Then
                    Counter()
                End If
            Else
                cekPD = False
            End If
        End If
    End Function

    Private Function cekSIUP(ByVal obj As PermohonanDetail) As Boolean
        Dim siupID As SIUP = session1.FindObject(Of SIUP)(New BinaryOperator("SIUPID", obj.PermohonanIzinID))
        If siupID IsNot Nothing Then
            Session("SIUPID") = siupID.SIUPID
            Return True
        Else
            Session("SIUPID") = Nothing
            Return False
        End If
    End Function

    Private Sub Counter()
        Dim obj As SIUP = session1.FindObject(Of SIUP)(New BinaryOperator("SIUPID", (Session("SIUPID").ToString)))
        Dim konter As Integer = obj.Counter
        If konter = 0 Then
            obj.Counter = 1
        Else
            obj.Counter = konter + 1
        End If
        obj.Save()
    End Sub

#End Region

#Region " Callback "

    Protected Sub KelurahanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles KelurahanASPxCallback.Callback
        Session("KelurahanID") = e.Parameter
    End Sub

    Protected Sub KelurahanCombobox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanID") = e.Parameter
        Dim dv As DetailsView = SIUPDetailView
        Dim cbKelurahan As ASPxComboBox = DirectCast(dv.FindControl("KelurahanPerusahaanASPxCombobox"), ASPxComboBox)
        If cbKelurahan IsNot Nothing Then
            cbKelurahan.DataBind()
        End If
    End Sub

#End Region

#Region " GridView "

    Protected Sub KLUIASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues("SIUPID!Key") = Session("SIUPID")
    End Sub

    Protected Sub SIUPBankASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues("SIUPID!Key") = Session("SIUPID")
    End Sub

#End Region

#Region " DetailView 1 "

    Protected Sub SIUPDetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles SIUPDetailView.DataBound
        Kombo_box()
    End Sub

    Private Sub Kombo_box()
        Dim dv As DetailsView = SIUPDetailView
        Dim objSIUP As SIUP = session1.FindObject(Of SIUP)(New BinaryOperator("SIUPID", Session("SIUPID")))
        If dv.CurrentMode = DetailsViewMode.Edit Then
            Dim cbJenisPerusahaan As ASPxComboBox = DirectCast(dv.FindControl("LegalitasPerusahaanASPxComboBox"), ASPxComboBox)
            Dim cbKecamatan As ASPxComboBox = DirectCast(dv.FindControl("KecamatanPerusahaanASPxCombobox"), ASPxComboBox)
            Dim cbKelurahan As ASPxComboBox = DirectCast(dv.FindControl("KelurahanPerusahaanASPxCombobox"), ASPxComboBox)
            Dim cbBentukPerusahaan As ASPxComboBox = DirectCast(dv.FindControl("BentukPerusahaanASPxCombobox"), ASPxComboBox)
            Dim deTanggal As ASPxDateEdit = DirectCast(dv.FindControl("TglinputASPxDateEdit"), ASPxDateEdit)
            If deTanggal IsNot Nothing Then
                If deTanggal IsNot Nothing Then
                    deTanggal.Date = Date.Now
                End If
            End If
            If cbKelurahan IsNot Nothing And objSIUP.PerusahaanKelurahanID IsNot Nothing Then
                cbKelurahan.Value = objSIUP.PerusahaanKelurahanID.KelurahanID
                Session("KelurahanID") = objSIUP.PerusahaanKelurahanID.KelurahanID
                cbKelurahan.Text = objSIUP.PerusahaanKelurahanID.KelurahanNama
                cbKecamatan.Value = objSIUP.PerusahaanKelurahanID.KelurahanKecamatanID.KecamatanID
                cbKecamatan.Text = objSIUP.PerusahaanKelurahanID.KelurahanKecamatanID.KecamatanNama
            Else
                If CStr(Session("KelurahanID")) IsNot Nothing Then
                    Dim kelurahanid As CriteriaOperator = CriteriaOperator.Parse("KelurahanID='" & Session("KelurahanID").ToString & "'")
                    Dim Kelurahan As Kelurahan = DirectCast(session1.FindObject(GetType(Kelurahan), kelurahanid), Kelurahan)
                    cbKelurahan.Value = Kelurahan.KelurahanID
                    cbKelurahan.Text = Kelurahan.KelurahanNama
                    cbKecamatan.Value = Kelurahan.KelurahanKecamatanID.KecamatanID
                    cbKecamatan.Text = Kelurahan.KelurahanKecamatanID.KecamatanNama
                End If
            End If
            If cbBentukPerusahaan IsNot Nothing Then
                If objSIUP.PerusahaanBentukID IsNot Nothing Then
                    cbBentukPerusahaan.Value = objSIUP.PerusahaanBentukID.BentukPerusahaanID
                    Session("BentukPerusahaanID") = objSIUP.PerusahaanBentukID.BentukPerusahaanID.ToString
                    cbBentukPerusahaan.Text = objSIUP.PerusahaanBentukID.BentukPerusahaan
                End If
            End If

        End If
    End Sub

    Protected Sub SIUPDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles SIUPDetailView.ItemUpdated
        SIUPDetailView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub SIUPDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles SIUPDetailView.ItemUpdating
        Dim objSIUP As SIUP = session1.FindObject(Of SIUP)(New BinaryOperator("SIUPID", Session("SIUPID")))

        Dim dv As DetailsView = SIUPDetailView
        Dim cbLegalitas As ASPxComboBox = DirectCast(dv.FindControl("LegalitasPerusahaanASPxComboBox"), ASPxComboBox)
        Dim kelurahan As Kelurahan = session1.FindObject(Of Kelurahan)(New BinaryOperator("KelurahanID", Session("KelurahanID")))
        Dim tbModal As ASPxTextBox = DirectCast(dv.FindControl("ModalASPxTextBox"), ASPxTextBox)
        Dim nmodal As Integer = CInt(tbModal.Text)

        Dim cbBentukPerusahan As ASPxComboBox = DirectCast(dv.FindControl("BentukPerusahaanASPxCombobox"), ASPxComboBox)
        If cbBentukPerusahan IsNot Nothing Then
            Session("BentukPerusahaanID") = cbBentukPerusahan.Value.ToString
        End If

        Dim objSIUPbentuk As SIUPtBentuk = session1.FindObject(Of SIUPtBentuk)(New BinaryOperator("BentukPerusahaanID", Session("BentukPerusahaanID")))

        If objSIUP IsNot Nothing Then
            If kelurahan IsNot Nothing Then
                objSIUP.PerusahaanKelurahanID = kelurahan
            End If
            If Kategori_save(nmodal) IsNot Nothing Then
                objSIUP.Kategori = Kategori_save(nmodal)
                Dim mbaca As New Baca
                objSIUP.Modal = nmodal
                objSIUP.ModalTerbilang = mbaca.Terbilang(nmodal.ToString)
            End If
            If objSIUPbentuk IsNot Nothing Then
                objSIUP.PerusahaanBentukID = objSIUPbentuk
            End If
            objSIUP.Maksud = Session("Status").ToString
            objSIUP.Save()
        End If
    End Sub

    Private Function Kategori_save(ByVal nModal As Integer) As String
        Dim besar As SIUPModal = DirectCast(session1.FindObject(GetType(SIUPModal), CriteriaOperator.Parse("JenisModal='Besar'")), SIUPModal)
        Dim sedang As SIUPModal = DirectCast(session1.FindObject(GetType(SIUPModal), CriteriaOperator.Parse("JenisModal='Sedang'")), SIUPModal)
        Dim kecil As SIUPModal = DirectCast(session1.FindObject(GetType(SIUPModal), CriteriaOperator.Parse("JenisModal='Kecil'")), SIUPModal)
        Dim modal As String = ""
        If nModal >= besar.Modal Then
            modal = besar.JenisModal
        ElseIf nModal > kecil.Modal And nModal < besar.Modal Then
            modal = sedang.JenisModal
        Else
            modal = kecil.JenisModal
        End If
        Return "SIUP " & modal
    End Function



#End Region

#Region " Round Panel"
    Protected Sub MaksudASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim maksud As String = MaksudASPxComboBox.Text.Trim
        If maksud = "Memperoleh SIUP" Then
            MaksudASPxLabel.Text = "Baru"
            Session("Status") = "Baru"
            LanjutASPxButton.Enabled = True
        Else
            MaksudASPxLabel.Text = "Perubahan"
            Session("Status") = "Daftar Ulang"
            LanjutASPxButton.Enabled = True
        End If
    End Sub
    Protected Sub LanjutASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        MaksudASPxComboBox.Visible = False
        MaksudASPxTextBox.Visible = True
        MaksudASPxLabel.Text = "Masukan Nomor Permohonan"
        ASPxButton2.Visible = True
        LanjutASPxButton.Visible = False
    End Sub
    Protected Sub GantiASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        MaksudASPxTextBox.Visible = False
        MaksudASPxComboBox.Visible = True
        LanjutASPxButton.Visible = True
        ASPxButton2.Visible = False
        MaksudASPxLabel.Text = "( Pilih Ketentuan yang diinginkan )"
        If MaksudASPxLabel.Text = "( Pilih Ketentuan yang diinginkan )" Then
            MaksudASPxComboBox.SelectedIndex = -1
        End If

        LanjutASPxButton.Enabled = False
    End Sub
    Protected Sub ASPxButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'cari no izin
        cariPermohonan()
        GantiASPxButton.Visible = False
        ASPxButton3.Visible = True
        ASPxButton2.Visible = False
        MaksudASPxTextBox.Enabled = False
    End Sub
    Protected Sub ASPxButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        MaksudASPxComboBox.Visible = True
        MaksudASPxComboBox.SelectedIndex = -1
        LanjutASPxButton.Enabled = False
        MaksudASPxLabel.Text = "( Pilih Ketentuan yang diinginkan )"
        MaksudASPxTextBox.Visible = False
        MaksudASPxTextBox.Enabled = True
        SIUPDetailView.Visible = False
        GantiASPxButton.Visible = True
        ASPxButton3.Visible = False
        LanjutASPxButton.Visible = True
        ASPxButton2.Visible = False
        Session("Status") = Nothing
    End Sub
#End Region

End Class
