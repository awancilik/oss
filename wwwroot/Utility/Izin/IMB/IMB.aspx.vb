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
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_IMB
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IMBXpoDataSource.Session = session1
        TujuanIMBXpoDataSource.Session = session1
        PropinsiXpoDataSource.Session = session1
        KabupatenXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        KecamatanXpoDataSource2.Session = session1
        KelurahanXpoDataSource2.Session = session1
        PelaksanaXpoDataSource.Session = session1
        StatusTanahXpoDataSource.Session = session1
        JenisBangunanXpoDataSource.Session = session1
        IMBLantaiXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub PemilikMenu_ItemClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxMenu.MenuItemEventArgs) Handles PemilikMenu.ItemClick
        simpan()
    End Sub

    'Protected Sub ASPxMenu1_ItemClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxMenu.MenuItemEventArgs) Handles ASPxMenu1.ItemClick
    '    If e.Item.Text = "New" Then
    '        simpan()
    '        IMBLantaiXpoDataSource.Criteria = "NoIjin=''"
    '        BangunanTambahanGridView.DataBind()
    '        BTLantaiTextBox.ReadOnly = False
    '        BTLuasTextBox.ReadOnly = False
    '        SaveBTButton.Visible = True
    '        BangunanTambahanGridView.Visible = True
    '    ElseIf e.Item.Name = "Edit" Then
    '        BangunanTambahanGridView.StartEdit(BangunanTambahanGridView.FocusedRowIndex())
    '    ElseIf e.Item.Name = "Delete" Then
    '        BangunanTambahanGridView.DeleteRow(BangunanTambahanGridView.FocusedRowIndex())
    '    End If
    'End Sub

    'Protected Sub SaveBTButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveBTButton.Click
    '    BangunanTambahanGridView.DataBind()
    '    Dim Lantai As String = BTLantaiTextBox.Text
    '    Dim Luas As String = BTLuasTextBox.Text
    '    Dim objIMBlantai As IMBlantai = New IMBlantai(session1)
    '    'objIMBlantai.IMBlantaiID = Guid.NewGuid
    '    objIMBlantai.IMBID = CType(Session("IMBID"), Guid)
    '    objIMBlantai.Lantai = CInt(Lantai)
    '    objIMBlantai.Luas = CSng(Luas)
    '    If Session("IMBID") IsNot Nothing Then
    '        objIMBlantai.Save()
    '    End If
    '    IMBLantaiXpoDataSource.Criteria = "IMBID = '" & Session("IMBID").ToString & "'"
    '    BangunanTambahanGridView.DataBind()
    '    BTLantaiTextBox.Text = ""
    '    BTLuasTextBox.Text = ""
    'End Sub

    Protected Sub CariNoIjin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariNoIjin.Click
        Dim NoPermohonan As String = CariNoPermohonanTextBox.Text.ToString.Trim
        If NoPermohonan <> "" Then
            Dim query As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & NoPermohonan & "'")
            Dim oPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query), Permohonan)
            Dim perDetail As Guid = oPermohonan.PermohonanID
           Dim pDetail As PermohonanDetail = DirectCast(oPermohonan.PermohonanDetail.Object(0), PermohonanDetail)
            Session("IMBID") = pDetail.PermohonanIzinID
            Session("PermohonanID") = NoPermohonan

            Dim kelurahannama As Kelurahan = oPermohonan.PemohonKelurahanID

            'Pemilik
            '*******************************************************

            PemilikNoKTPTextBox.Text = oPermohonan.PemohonNIK
            PemilikNamaTextBox.Text = oPermohonan.PemohonNama
            PemilikTelponTextBox.Text = oPermohonan.PemohonTelpon
            PemilikFaxTextBox.Text = oPermohonan.PemohonFax
            PemilikAlamatTextBox.Text = oPermohonan.PemohonAlamat
            PemilikRTTextBox.Text = oPermohonan.PemohonRT
            PemilikRWTextBox.Text = oPermohonan.PemohonRW
            KodePosPemilikTextBox.Text = oPermohonan.PemohonKodePos
            Try
                PemilikKelurahanComboBox.Text = oPermohonan.PemohonKelurahanID.KelurahanNama
            Catch ex As Exception

            End Try


            '*******************************************************
        End If
    End Sub

    Public Sub simpan()

        Dim NomorPermohonan As String = CStr(Session("PermohonanID"))
        If NomorPermohonan Is Nothing Then
            NomorPermohonan = ""
        End If
        Dim PermohonanID As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & NomorPermohonan & "'")

        Dim perusahaan As Guid = Guid.NewGuid
        Try
            Dim cek As String = CStr(Session("IMBID"))
            If cek Is Nothing Then
                Session("IMBID") = Guid.NewGuid
            End If
        Catch ex As Exception

        End Try

        Dim objimb As IMB = DirectCast(session1.GetObjectByKey(GetType(IMB), Session("IMBID")), IMB)
        If objimb Is Nothing Then
            objimb = New IMB(session1)
            objimb.IMBID = Guid.NewGuid
        End If
        'Noijin
        objimb.NoIjin = CStr(Session("NomorIjin"))
        objimb.NoIjinIPB = CStr(Session("NoIjinIPB"))
        objimb.NoIjinSementara = CStr(Session("NoIjinSementara"))
        objimb.TglNoIjinIPB = CDate(Session("TglIjinIPB"))
        objimb.TglNoIjinSementara = CDate(Session("TglIjinSementara"))
        objimb.TglDikeluarkan = CDate(Session("TglIjin"))

        'Pemilik variabel
        '**********************************************
        Dim pKabupaten As Kabupaten = DirectCast(session1.GetObjectByKey(GetType(Kabupaten), New Guid(PemilikKabupatenComboBox.SelectedItem.Value.ToString)), Kabupaten)
        Dim pMaksud As IMBtujuan = DirectCast(session1.GetObjectByKey(GetType(IMBtujuan), New Guid(PemilikMaksudComboBox.SelectedItem.Value.ToString)), IMBtujuan)
        Dim pPelaksana As IMBpelaksana = DirectCast(session1.GetObjectByKey(GetType(IMBpelaksana), New Guid(PemilikPelaksanaComboBox.SelectedItem.Value.ToString)), IMBpelaksana)

        'save
        Dim ktp As String = PemilikNoKTPTextBox.Text.ToString
        objimb.NoKTP = ktp
        objimb.Nama = PemilikNamaTextBox.Text.ToString
        objimb.Alamat = PemilikAlamatTextBox.Text.ToString
        objimb.RT = CByte(PemilikRTTextBox.Text.ToString)
        objimb.RW = CByte(PemilikRWTextBox.Text.ToString)
        objimb.Kelurahan = PemilikKelurahanComboBox.SelectedItem.Text.ToString
        objimb.Kecamatan = PemilikKecamatanComboBox.SelectedItem.Text.ToString
        objimb.KabupatenID = pKabupaten.KabupatenID
        objimb.KodePos = KodePosPemilikTextBox.Text.ToString
        objimb.Telp = PemilikTelponTextBox.Text.ToString
        objimb.Fax = PemilikFaxTextBox.Text.ToString
        objimb.TujuanID = pMaksud.TujuanID
        objimb.PelaksanaID = pPelaksana.PelaksanaID
        'Bangunan
        '*********************************************

        Dim bKelurahan As Kelurahan = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), New Guid(bKelurahanLokasiComboBox.SelectedItem.Value.ToString)), Kelurahan)
        Dim bStatusTanah As tanah = DirectCast(session1.GetObjectByKey(GetType(tanah), New Guid(bStatusTanahComboBox.SelectedItem.Value.ToString)), tanah)
        Dim bJenisBangunan As IMBbangunan = DirectCast(session1.GetObjectByKey(GetType(IMBbangunan), New Guid(bJenisBangunanComboBox.SelectedItem.Value.ToString)), IMBbangunan)


        'save
        objimb.lksAlamat = bLokasiBangunanTextBox.Text
        objimb.lksKelurahanID = bKelurahan.KelurahanID
        objimb.lksRT = CByte(bRTTextBox.Text)
        objimb.lksRW = CByte(bRWTextBox.Text)
        objimb.lksKodePos = bKodeposTextBox.Text
        objimb.NoSertifikat = bNoSertifikatTextBox.Text
        objimb.PmlkSertifikat = bPemilikSertifikatTextBox.Text
        objimb.StatusTanahID = DirectCast(session1.GetObjectByKey(GetType(tanah), bStatusTanah.StatusTanahID), tanah)
        'masterdatasertifikat
        'Dim objserti As IMBsertifikat = New IMBsertifikat(session1)
        '********************************************

        objimb.JenisBangunanID = DirectCast(session1.GetObjectByKey(GetType(IMBbangunan), bJenisBangunan.JenisBangunanID), IMBbangunan)
        objimb.LuasBangunan = CSng(bLuasBangunanTextBox.Text)
        objimb.Luas = CSng(bLuasTanahTextBox.Text)
        '*********************************************

        'Sarana Bangunan
        '*********************************************
        objimb.FungsiBangunan = sbFungsiBangunanTextBox.Text
        objimb.GSP = CInt(sbGSPTextBox.Text)
        objimb.GSB = CInt(sbGSBTextBox.Text)
        objimb.KDB = CInt(sbKDPTextBox.Text)
        objimb.Jarak = CInt(sbJarakDariSumbuJalanTextBox.Text)
        objimb.NamaJalan = sbDariJalanTextBox.Text
        '********************************************* 
        If NomorPermohonan IsNot "" Then
            objimb.permohonanID = DirectCast(session1.FindObject(GetType(Permohonan), PermohonanID), Permohonan)
        Else
            objimb.permohonanID = Nothing
        End If

        'objimb.PerusahaanNama = perusahaan
        '****************************
        objimb.Save()


        'SavePerusahaan
        Dim objPerusahaan As Perusahaan = New Perusahaan(session1)
        With objPerusahaan
            .PerusahaanID = perusahaan
            .NamaPerusahaan = PerusahaanNamaTextBox.Text
            .FaxPerusahaan = PerusahaanFaxTextBox.Text
            .TelpPerusahaan = PerusahaanTelponTextBox.Text
            .Kabupaten = "Kudus"
            .Kecamatan = PerusahaanKecamatanComboBox.SelectedItem.Text
            .AlamatPerusahaan = PerusahaanAlamatTextBox.Text.ToString
            .KodePosPerusahaan = PerusahaanKodePosTextBox.Text
            .NamaPemilik = PemilikNamaTextBox.Text
            .AlamatPemilik = PemilikAlamatTextBox.Text
            .NoKTPPemilik = PemilikNoKTPTextBox.Text
            .TlpPemilik = PemilikTelponTextBox.Text
            .Save()
        End With
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        IMBLantaiXpoDataSource.Criteria = ""
    End Sub

    Protected Sub NoijinIPBButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoijinIPBButton.Click
        Session("NoIjinIPB") = NoIjinIPBTextBox.Text
        Session("TglIjinIPB") = TglIjinIPBDateEdit.Date
    End Sub

    Protected Sub NoIjinSementaraButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoIjinSementaraButton.Click
        Session("NoIjinSementara") = NoIjinSementaraTextBox.Text
        Session("TglIjinSementara") = TglIjinIPBDateEdit.Date
    End Sub

    Protected Sub IjinButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles IjinButton.Click
        Session("NomorIjin") = NomorIjinTextBox.Text
        Session("TglIjin") = NomorIjinDateEdit.Date
    End Sub

    Protected Sub BangunanTambahanASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IMBID") = Session("IMBID")
    End Sub

    Protected Sub PemilikKabupatenComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles PemilikKabupatenComboBox.SelectedIndexChanged
        Session("KabupatenID") = TryCast(sender, ASPxComboBox).SelectedItem.Value
        PemilikKecamatanComboBox.DataBind()
    End Sub

    Protected Sub PemilikKecamatanComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles PemilikKecamatanComboBox.SelectedIndexChanged
        Session("KecamatanID") = TryCast(sender, ASPxComboBox).SelectedItem.Value
        PemilikKelurahanComboBox.DataBind()
    End Sub

End Class
