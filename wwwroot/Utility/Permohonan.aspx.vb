Option Strict On
Option Explicit On

Imports Bisnisobjek.OSS
Imports DevExpress.Xpo
Imports System.Collections.Generic
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Data.Filtering.CriteriaOperator
Imports DevExpress.Xpo.SortingCollection
Imports DevExpress.Xpo.Session
Imports DevExpress.Xpo.Generators.CollectionCriteriaPatcher

Partial Class Utility_Permohonan
    Inherits System.Web.UI.Page
    Private session1 As Session

#Region " Xpo "

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        jenisIzinXpoDataSource.Session = session1
        imbXpoDataSource.Session = session1
        lokasiXpoDataSource.Session = session1
        iuiXpoDataSource.Session = session1
        iptXpoDataSource.Session = session1
        ipiXpoDataSource.Session = session1
        hoXpoDataSource.Session = session1
        tdiXpoDataSource.Session = session1
        siupXpoDataSource.Session = session1
        kabupatenXpoDataSource.Session = session1
        kecamatanXpoDataSource.Session = session1
        kelurahanXpoDataSource.Session = session1
        syaratIzinXpoDataSource.Session = session1
        masterDataSyaratXpoDataSource.Session = session1
        tdpXpoDataSource.Session = session1
        tdpJenisXpoDataSource.Session = session1
        SIUPJenisXpoDataSource.Session = session1
        HOIzinXpoDataSource.Session = session1
        JenisUsahaHOXpoDataSource.Session = session1

        BindingIMB()
        BindingLokasi()
        BindingIUI()
        BindingIPT()
        BindingIPI()
        BindingHO()
        BindingTDI()
        BindingSIUP()
        BindingTDP()
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#End Region

#Region " Binding Izin "

    Private Sub BindingIMB()
        Dim jenisIzinID As JenisIzin = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinNama", "IMB"))
        Session("JenisIzinIMB") = jenisIzinID.JenisIzinID
    End Sub

    Private Sub BindingLokasi()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='Lokasi'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinLokasi") = jenisIzinID
    End Sub

    Private Sub BindingIUI()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='IUI'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinUI") = jenisIzinID
    End Sub

    Private Sub BindingIPT()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='IPT'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinPT") = jenisIzinID
    End Sub

    Private Sub BindingIPI()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='IPI'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinPI") = jenisIzinID
    End Sub

    Private Sub BindingHO()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='HO'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinHO") = jenisIzinID
    End Sub

    Private Sub BindingTDI()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='TDI'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinTDI") = jenisIzinID
    End Sub

    Private Sub BindingSIUP()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='SIUP'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinSIUP") = jenisIzinID
    End Sub

    Private Sub BindingTDP()
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='TDP'")
        Dim jenisIzinID As Guid = DirectCast(session1.FindObject(GetType(JenisIzin), criteria), JenisIzin).JenisIzinID
        Session("JenisIzinTDP") = jenisIzinID
    End Sub

#End Region

#Region " Penyimpanan "

    Protected Sub saveASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles saveASPxButton.Click
        Dim cek As Boolean = True
        If siupASPxCheckBox.Checked = True Then
            cek = cekSifat()
        End If
        If CheckSyaratIzin() And cek = True Then
            BikinPermohonan()
        End If
    End Sub

    Private Function cekSifat() As Boolean
        If Not siupASPxComboBox.Text.Trim = "Baru" Then
            cekSifat = cekPembaruanSIUP()
        Else
            cekSifat = True
        End If
    End Function

    Private Sub BikinPermohonan()
        If imbASPxCheckBox.Checked = False And lokasiASPxCheckBox.Checked = False And iuiASPxCheckBox.Checked = False And ipiASPxCheckBox.Checked = False And tdiASPxCheckBox.Checked = False And hoASPxCheckBox.Checked = False And siupASPxCheckBox.Checked = False Then
            IzinPopup.ShowOnPageLoad = True
            'Throw New Exception("Data Jenis Izin harus dipilih")
        Else
            Dim objPermohonan As New Permohonan(session1)
            objPermohonan.PermohonanID = Guid.NewGuid
            'Ambil Nomor Permohonan terakhir
            Dim str As String = Bisnisobjek.Counter.CreateNo("NoPermohonan")
            objPermohonan.NomorPermohonan = str

            'Bind Text Box
            objPermohonan.TanggalPermohonan = tanggalPermohonanASPxDateEdit.Date
            If Not String.IsNullOrEmpty(nikPemohonASPxTextBox.Text) Then
                objPermohonan.PemohonNIK = nikPemohonASPxTextBox.Text
            End If
            If Not String.IsNullOrEmpty(namaPemohonASPxTextBox.Text) Then
                objPermohonan.PemohonNama = namaPemohonASPxTextBox.Text.Trim
            End If
            If Not String.IsNullOrEmpty(tempatLahirPemohonASPxTextBox.Text) Then
                objPermohonan.PemohonTempatLahir = tempatLahirPemohonASPxTextBox.Text
            End If
            objPermohonan.PemohonTanggalLahir = tanggalLahirPemohonASPxDateEdit.Date
            If Not String.IsNullOrEmpty(alamatPemohonASPxTextBox.Text) Then
                objPermohonan.PemohonAlamat = alamatPemohonASPxTextBox.Text.Trim
            End If

            objPermohonan.PemohonKodePos = kodePosPemohonASPxTextBox.Text
            objPermohonan.PemohonTelpon = teleponPemohonASPxTextBox.Text
            objPermohonan.PemohonFax = faxPemohonASPxTextBox.Text
            objPermohonan.PemohonPekerjaan = pekerjaanPemohonASPxTextBox.Text
            objPermohonan.Organisasi = organisasiPemohonASPxTextBox.Text
            objPermohonan.Jabatan = jabatanPemohonASPxTextBox.Text
            objPermohonan.Keterangan = keteranganASPxTextBox.Text
            objPermohonan.Save()
            BikinPermohonanDetail(objPermohonan)
            CetakBuktiPermohonan(objPermohonan)
        End If
        
    End Sub

    Public Sub BikinDaftarUlangHO()
        Dim objBaru As New Permohonan(session1)
        Dim noizin As String = GridHOIzin.GetRowValues(GridHOIzin.FocusedRowIndex(), "NoIzin").ToString.Trim
        Dim criteriaho As CriteriaOperator = CriteriaOperator.Parse("NoIzin='" & noizin & "'")
        Dim objHolama As HO = DirectCast(session1.FindObject(GetType(HO), criteriaho), HO)
        Dim objLama As Permohonan = session1.FindObject(Of Permohonan)(New BinaryOperator("PermohonanID", objHolama.PermohonanID))
        Dim str As String = Bisnisobjek.Counter.CreateNo("NoPermohonan")
        'objBaru.NomorPermohonan = str
        If objLama IsNot Nothing Then
            objBaru = objLama
            objBaru.PermohonanID = Guid.NewGuid
            objBaru.NomorPermohonan = str
            objBaru.PemohonNama = objLama.PemohonNama
            objBaru.PemohonAlamat = objLama.PemohonAlamat
            objBaru.PemohonKodePos = objLama.PemohonKodePos
            objBaru.PemohonTanggalLahir = objLama.PemohonTanggalLahir
            objBaru.PemohonTempatLahir = objLama.PemohonTempatLahir
            objBaru.PemohonTelpon = objLama.PemohonTelpon
            objBaru.PemohonPekerjaan = objLama.PemohonPekerjaan
            objBaru.Organisasi = objLama.Organisasi
            objBaru.Jabatan = objLama.Jabatan
            objBaru.Keterangan = objLama.Keterangan
            objBaru.PemohonNIK = objLama.PemohonNIK
            objBaru.TanggalPermohonan = objLama.TanggalPermohonan
            objBaru.Save()
            BikinPermohonanDetail(objBaru)
            CetakBuktiPermohonan(objBaru)
        End If
    End Sub

    Private Sub BikinPermohonanDetail(ByVal objPermohonan As Permohonan)
        'Bikin Permohonan Detail IMB
        If imbASPxCheckBox.Checked Then
            Dim objDetailIMB As New PermohonanDetail(session1)
            objDetailIMB.PermohonanID = objPermohonan
            objDetailIMB.JenisPermohonanIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(imbASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
            objDetailIMB.JenisIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisIzin), Session("JenisIzinIMB")), JenisIzin)
            Dim objIMB As New IMB(session1)
            objIMB.IMBID = Guid.NewGuid
            objIMB.permohonanID = objPermohonan
            objIMB.NoKTP = objPermohonan.PemohonNIK
            objIMB.Nama = objPermohonan.PemohonNama
            objIMB.Alamat = objPermohonan.PemohonAlamat
            objIMB.StatusTanahID = Nothing
            objIMB.JenisBangunanID = Nothing
            objIMB.Telp = objPermohonan.PemohonTelpon
            If Not String.IsNullOrEmpty(imbIzinLamaASPxTextBox.Text) Then
                objIMB.NoLama = imbIzinLamaASPxTextBox.Text
            End If
            objIMB.Save()
            objDetailIMB.PermohonanIzinID = objIMB.IMBID
            objDetailIMB.Save()
        End If

        'Bikin Permohonan Detail IUI
        If iuiASPxCheckBox.Checked Then
            Dim objDetailIUI As New PermohonanDetail(session1)
            objDetailIUI.PermohonanID = objPermohonan
            objDetailIUI.JenisPermohonanIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(iuiASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
            objDetailIUI.JenisIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisIzin), Session("JenisIzinUI")), JenisIzin)
            Dim objIUI As New IUI(session1)
            objIUI.IUIID = Guid.NewGuid
            objIUI.PermohonanID = objPermohonan
            objIUI.PemilikNama = objPermohonan.PemohonNama
            objIUI.PemilikAlamat = objPermohonan.PemohonAlamat
            objIUI.PemilikFax = objPermohonan.PemohonFax
            objIUI.PemilikNoKTP = objPermohonan.PemohonNIK
            objIUI.PemilikTelpon = objPermohonan.PemohonTelpon
            objIUI.PabrikKelurahanID = Nothing
            If Not String.IsNullOrEmpty(iuiLamaASPxTextBox.Text) Then

            End If
            objIUI.Save()
            objDetailIUI.PermohonanIzinID = objIUI.IUIID
            objDetailIUI.Save()
        End If

        'Bikin Permohonan Detail IPT
        'If iptASPxCheckBox.Checked Then
        '    Dim objDetailIPT As New PermohonanDetail(session1)
        '    objDetailIPT.PermohonanID = objPermohonan
        '    objDetailIPT.JenisPermohonanIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(iptASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
        '    objDetailIPT.JenisIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisIzin), Session("JenisIzinPT")), JenisIzin)
        '    Dim objIPT As New IPT(session1)
        '    objIPT.IPTID = Guid.NewGuid
        '    objIPT.PermohonanID = objPermohonan
        '    objIPT.NamaPemilik = objPermohonan.PemohonNama
        '    objIPT.AlamatPemilik = objPermohonan.PemohonAlamat
        '    objIPT.PemilikTelpon = objPermohonan.PemohonTelpon
        '    objIPT.Save()
        '    objDetailIPT.PermohonanIzinID = objIPT.IPTID
        '    objDetailIPT.Save()
        'End If

        'Bikin Permohonan Detail IPI
        If ipiASPxCheckBox.Checked Then
            Dim objDetailIPI As New PermohonanDetail(session1)
            objDetailIPI.PermohonanID = objPermohonan
            objDetailIPI.JenisPermohonanIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(IPIASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
            objDetailIPI.JenisIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisIzin), Session("JenisIzinPI")), JenisIzin)
            Dim objIPI As New IPI(session1)
            objIPI.IPIID = Guid.NewGuid
            objIPI.PermohonanID = objPermohonan
            objIPI.PemilikNama = objPermohonan.PemohonNama
            objIPI.PemilikAlamat = objPermohonan.PemohonAlamat
            objIPI.PemilikFax = objPermohonan.PemohonFax
            objIPI.PemilikNoKTP = objPermohonan.PemohonNIK
            objIPI.PemilikTelpon = objPermohonan.PemohonTelpon
            objIPI.PabrikKelurahanID = Nothing
            objIPI.Save()
            objDetailIPI.PermohonanIzinID = objIPI.IPIID
            objDetailIPI.Save()
        End If
        'Bikin Permohonan Detail Lokasi
        If lokasiASPxCheckBox.Checked Then
            Dim objDetailLokasi As New PermohonanDetail(session1)
            objDetailLokasi.PermohonanID = objPermohonan
            objDetailLokasi.JenisPermohonanIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(lokasiASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
            objDetailLokasi.JenisIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisIzin), Session("JenisIzinLokasi")), JenisIzin)
            Dim objLokasi As New Lokasi(session1)
            objLokasi.LokasiID = Guid.NewGuid
            objLokasi.PermohonanID = objPermohonan
            objLokasi.NamaPemilik = objPermohonan.PemohonNama
            objLokasi.AlamatPemilik = objPermohonan.PemohonAlamat
            objLokasi.StatusTanahID = Nothing
            objLokasi.PemilikKabupatenID = Nothing
            objLokasi.PemilikKecamatanID = Nothing
            objLokasi.PemilikKelurahanID = Nothing
            objLokasi.LokasiKabupatenID = Nothing
            objLokasi.LokasiKecamatanID = Nothing
            objLokasi.LokasiKelurahanID = Nothing
            objLokasi.Save()
            objDetailLokasi.PermohonanIzinID = objLokasi.LokasiID
            objDetailLokasi.Save()
        End If
        'Bikin Permohonan Detail TDI
        If tdiASPxCheckBox.Checked Then
            Dim objTDIDetail As New PermohonanDetail(session1)
            objTDIDetail.PermohonanID = objPermohonan
            objTDIDetail.JenisPermohonanIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(TDIASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
            objTDIDetail.JenisIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisIzin), Session("JenisIzinTDI")), JenisIzin)
            Dim objTDI As New TDI(session1)
            objTDI.TDIID = Guid.NewGuid
            objTDI.PermohonanID = objPermohonan
            objTDI.PemilikNoKTP = objPermohonan.PemohonNIK
            objTDI.PemilikNama = objPermohonan.PemohonNama
            objTDI.PemilikAlamat = objPermohonan.PemohonAlamat
            objTDI.PemilikKodepos = objPermohonan.PemohonTelpon
            objTDI.PemilikTelpon = objPermohonan.PemohonTelpon
            objTDI.PemilikFax = objPermohonan.PemohonFax
            objTDI.rek_id = Nothing
            objTDI.Save()
            objTDIDetail.PermohonanIzinID = objTDI.TDIID
            objTDIDetail.Save()
        End If
        'Bikin Permohonan Detail HO
        If hoASPxCheckBox.Checked Then
            Dim objHODetail As New PermohonanDetail(session1)
            objHODetail.PermohonanID = objPermohonan
            objHODetail.JenisPermohonanIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(hoASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
            objHODetail.JenisIzinID = DirectCast(session1.GetObjectByKey(GetType(JenisIzin), Session("JenisIzinHO")), JenisIzin)
            Dim lama As Boolean = False
            Dim objHO As New HO(session1)
            Dim objPerm As New Permohonan(session1)
            Dim AlatBaru As New HOAlat(session1)
            Dim objBAP As New HOBAP(session1)
            Dim objBAPDet As New HOBAPDetail(session1)
            Dim HORet As New HORetribusi(session1)
            objHO.HOID = Guid.NewGuid
            Dim id As Guid = Guid.NewGuid
            Dim IDlama As Guid
            If Not hoASPxComboBox.SelectedItem.Text = "Baru" Then
                Dim noizin As String = CStr(GridHOIzin.GetRowValues(GridHOIzin.FocusedRowIndex(), "NoIzin")).Trim
                Dim criteriaho As CriteriaOperator = CriteriaOperator.Parse("NoIzin='" & noizin & "'")
                Dim objlama As HO = DirectCast(session1.FindObject(GetType(HO), criteriaho), HO)
                Dim objAlatLama As HOAlat = session1.FindObject(Of HOAlat)(New BinaryOperator("HOID", objlama.HOID))
                Dim objRetLama As HORetribusi = session1.FindObject(Of HORetribusi)(New BinaryOperator("HOID", objlama.HOID))
                'Dim objBAPLama As HOBAP = session1.FindObject(Of HOBAP)(New BinaryOperator("HOID", objlama.HOID))
                'Dim objBAPDetLama As HOBAPDetail = session1.FindObject(Of HOBAPDetail)(New BinaryOperator("HOBAPID", objBAPLama.HOBAPID))
                lama = True
                If objlama IsNot Nothing Then
                    IDlama = objlama.HOID
                    objHO = objlama
                    objHO.HOID = id
                    AlatBaru.HOID = objHO
                    objHO.NoLama = objlama.NoIzin
                    objHO.TglLama = objlama.TglDikeluarkan
                    objHO.NoIzin = Nothing
                    objHO.TglDikeluarkan = Nothing
                    objHO.Save()
                    HORet.Save()
                End If

                'If objBAP IsNot Nothing And objBAPDetLama IsNot Nothing Then
                '    objBAP = objBAPLama
                '    objBAP.HOBAPID = id
                '    objBAP.HOID = objHO
                '    objBAP.Kesimpulan = objBAPLama.Kesimpulan
                '    objBAPDet = objBAPDetLama
                '    objBAPDet.HOBAPID = objBAP
                '    objBAPDet.Saran = objBAPDet.Saran
                '    objBAPDet.TimTeknis.TImTeknis = objBAPDetLama.TimTeknis.TImTeknis
                '    objBAP.Save()
                '    objBAPDet.Save()
                'End If
                If lama = True Then
                    IsiChildHO(IDlama, id)
                End If
            End If
            objHO.PermohonanID = objPermohonan
            objHO.NamaPemilik = objPermohonan.PemohonNama
            objHO.AlamatPemilik = objPermohonan.PemohonAlamat
            objHO.Save()
            objHODetail.PermohonanIzinID = objHO.HOID
            objHODetail.Save()
        End If

        'Bikin Permohonan Detail SIUP
        If siupASPxCheckBox.Checked Then
            Dim jenissiup As String = siupJenisASPxComboBox.Text.Trim
            Dim objsiupDetail As New PermohonanDetail(session1)
            objsiupDetail.PermohonanID = objPermohonan
            objsiupDetail.JenisPermohonanIzinID = session1.FindObject(Of JenisPermohonanIzin)(New BinaryOperator("JenisPermohonanIzinID", siupASPxComboBox.SelectedItem.Value.ToString))
            objsiupDetail.JenisIzinID = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinID", siupJenisASPxComboBox.Value))
            Dim lama As Boolean = False
            Dim objsiup As SIUP = New SIUP(session1)
            Dim id As Guid = Guid.NewGuid
            Dim siuplama As SIUP
            Dim IDlama As Guid
            If Not siupASPxComboBox.SelectedItem.Text = "Baru" Then
                siuplama = PembaruanSIUP(siupIzinLamaASPxTextBox.Text.Trim)
                If siuplama IsNot Nothing Then
                    IDlama = siuplama.SIUPID
                    objsiup = siuplama
                    objsiup.SIUPID = id
                    objsiup.NoLama = siuplama.NoIjin
                    objsiup.TglLama = siuplama.TglDikeluarkan
                    objsiup.NoIjin = Nothing
                    objsiup.TglDikeluarkan = Nothing
                    objsiup.PenerimaSIUPNama = Nothing
                    objsiup.PenerimaSIUPAlamat = Nothing
                    lama = True
                End If
            End If
            If lama = False Then
                objsiup.SIUPID = id
            End If
            objsiup.PermohonanID = objPermohonan
            objsiup.PemilikNama = objPermohonan.PemohonNama
            objsiup.PemilikAlamat = objPermohonan.PemohonAlamat
            objsiup.rek_id = Nothing
            objsiup.JenisIzinID = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinID", siupJenisASPxComboBox.Value))
            objsiup.PemilikTTL = objPermohonan.PemohonTempatLahir & ", " & objPermohonan.PemohonTanggalLahir
            objsiup.Save()
            objsiupDetail.PermohonanIzinID = objsiup.SIUPID
            objsiupDetail.Save()
            If lama = True Then
                IsiChildSIUP(IDlama, id)
            End If
        End If

        'Bikin Permohonan Detail TDP
        'If tdpASPxCheckBox.Checked Then
        '    Dim jenisTDP As String = tdpJenisASPxComboBox.Text.Trim
        '    Dim objTDPDetail As New PermohonanDetail(session1)
        '    objTDPDetail.PermohonanID = objPermohonan
        '    objTDPDetail.JenisPermohonanIzinID = session1.FindObject(Of JenisPermohonanIzin)(New BinaryOperator("JenisPermohonanIzinID", tdpASPxComboBox.SelectedItem.Value.ToString))
        '    objTDPDetail.JenisIzinID = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinID", tdpJenisASPxComboBox.Value))
        '    Dim lama As Boolean = False
        '    Dim objTDP As TDP = New TDP(session1)
        '    Dim id As Guid = Guid.NewGuid
        '    Dim TDPlama As TDP
        '    Dim IDlama As Guid
        '    If Not tdpASPxComboBox.SelectedItem.Text = "Baru" Then
        '        TDPlama = PembaruanTDP(tdpIzinLamaASPxTextBox.Text.Trim)
        '        IDlama = TDPlama.TDPID
        '        objTDP = TDPlama
        '        objTDP.TDPID = id
        '        objTDP.NoLama = TDPlama.NoIjin
        '        objTDP.TglLama = TDPlama.TglDikeluarkan
        '        objTDP.NoIjin = Nothing
        '        objTDP.TglDikeluarkan = Nothing
        '        objTDP.PenerimaTDPNama = Nothing
        '        objTDP.PenerimaTDPAlamat = Nothing
        '        lama = True
        '    End If
        '    If lama = False Then
        '        objTDP.TDPID = id
        '    End If
        '    objTDP.PermohonanID = objPermohonan
        '    objTDP.PemilikNama = objPermohonan.PemohonNama
        '    objTDP.PemilikAlamat = objPermohonan.PemohonAlamat
        '    objTDP.rek_id = Nothing
        '    objTDP.JenisIzinID = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinID", tdpJenisASPxComboBox.Value))
        '    objTDP.Save()
        '    objTDPDetail.PermohonanIzinID = objTDP.TDPID
        '    objTDPDetail.Save()
        '    If lama = True Then
        '        IsiChildTDP(IDlama, id)
        '    End If
        'End If
        ClearData(objPermohonan)
    End Sub

    Private Sub CetakBuktiPermohonan(ByVal obj As Permohonan)
        Dim noPermohonan As String = obj.NomorPermohonan.Trim
        Dim jenisIzin As String = ""
        Dim objDetail As XPCollection(Of PermohonanDetail) = obj.PermohonanDetail
        For i As Integer = 0 To objDetail.Count - 1
            If i + 1 < objDetail.Count Then
                jenisIzin = jenisIzin + objDetail.Object(i).JenisIzinID.JenisIzinNama + ", "
            Else
                jenisIzin = jenisIzin + objDetail.Object(i).JenisIzinID.JenisIzinNama
            End If
        Next
        If Not String.IsNullOrEmpty(noPermohonan) Then
            Dim permohonan As New PermohonanReport.Parameters(noPermohonan, jenisIzin)
            permohonan.OpenReportInNewWindow()
        End If
    End Sub

    Private Sub ClearData(ByVal obj As Permohonan)
        imbASPxCheckBox.Checked = False
        imbASPxComboBox.SelectedIndex = -1
        If imbIzinLamaASPxTextBox.Visible = True Then
            imbIzinLamaASPxTextBox.Text = ""
        End If

        lokasiASPxCheckBox.Checked = False
        lokasiASPxComboBox.SelectedIndex = -1

        iuiASPxCheckBox.Checked = False
        iuiASPxComboBox.SelectedIndex = -1

        ipiASPxCheckBox.Checked = False
        IPIASPxComboBox.SelectedIndex = -1

        hoASPxCheckBox.Checked = False
        hoASPxComboBox.SelectedIndex = -1

        tdiASPxCheckBox.Checked = False
        TDIASPxComboBox.SelectedIndex = -1

        siupJenisASPxComboBox.SelectedIndex = -1
        siupASPxComboBox.SelectedIndex = -1
        siupASPxCheckBox.Checked = False
        tanggalPermohonanASPxDateEdit.Date = DateTime.Today
        nikPemohonASPxTextBox.Text = ""
        namaPemohonASPxTextBox.Text = ""
        tempatLahirPemohonASPxTextBox.Text = ""
        tanggalLahirPemohonASPxDateEdit.Date = Nothing
        alamatPemohonASPxTextBox.Text = ""
        kodePosPemohonASPxTextBox.Text = ""
        teleponPemohonASPxTextBox.Text = ""
        faxPemohonASPxTextBox.Text = ""
        kodePosPemohonASPxTextBox.Text = ""
        pekerjaanPemohonASPxTextBox.Text = ""
        organisasiPemohonASPxTextBox.Text = ""
        jabatanPemohonASPxTextBox.Text = ""
        keteranganASPxTextBox.Text = ""
        Session("JenisPermohonanIzinID") = Nothing
        syaratIzinXpoDataSource.Criteria = ""
        syaratIzinXpoDataSource.DataBind()
        syaratIzinASPxGridView.DataBind()
    End Sub

#End Region

#Region " Cek Pembaruan "

    Private Function cekPembaruanSIUP() As Boolean
        Dim noijin As String = siupIzinLamaASPxTextBox.Text.ToString.Trim
        If noijin.Length < 0 Then
            Dim izinID As JenisIzin = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinID", siupJenisASPxComboBox.Value))
            Dim query As CriteriaOperator = CriteriaOperator.Parse("NoIjin='" & noijin & "' And JenisIzinID='" & izinID.JenisIzinID.ToString & "'")
            Dim obj As SIUP = session1.FindObject(Of SIUP)(query)
            If obj Is Nothing Then
                Return False
            Else
                Return True
            End If
        Else
            BikinPermohonan()
        End If
    End Function

#End Region

#Region " Simpan Pembaruan "

    Private Function PembaruanSIUP(ByVal noIzin As String) As SIUP
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NoIjin='" & noIzin & "' And JenisIzinID='" & siupJenisASPxComboBox.Value.ToString & "'")
        Dim obj As SIUP = DirectCast(session1.FindObject(GetType(SIUP), query1), SIUP)
        If obj IsNot Nothing Then
            PembaruanSIUP = obj
        Else
            PembaruanSIUP = Nothing
        End If
    End Function

    Private Sub IsiChildHO(ByVal idLama As Guid, ByVal idBaru As Guid)
        'Alat
        Dim objAlat As New XPCollection(Of HOAlat)(session1)
        Dim alatlama As New XPCollection(Of HOAlat)(session1, New BinaryOperator("HOID", idLama))
        objAlat = alatlama
        If Not objAlat.Count = 0 Then
            For x As Integer = 0 To objAlat.Count - 1
                Dim nAlat As New HOAlat(session1)
                nAlat = objAlat.Object(x)
                nAlat.AlatID = Guid.NewGuid
                nAlat.HOID = session1.FindObject(Of HO)(New BinaryOperator("HOID", idBaru))
                nAlat.Save()
            Next
        End If

        'Pemeriksaan

        'Dim objPeriksa As New XPCollection(Of HOPemeriksaan)(session1)
        'Dim objPeriksaLama As New XPCollection(Of HOPemeriksaan)(session1, New BinaryOperator("HOID.HOID", idLama))
        'objPeriksa = objPeriksaLama
        'If Not objPeriksa.Count = 0 Then
        '    For x As Integer = 0 To objPeriksa.Count - 1
        '        Dim nPeriksa As New HOPemeriksaan(session1)
        '        nPeriksa = objPeriksa.Object(x)
        '        nPeriksa.HOPemeriksaanID = Guid.NewGuid
        '        nPeriksa.HOID = session1.FindObject(Of HO)(New BinaryOperator("HOID", idBaru)).HOID
        '        nPeriksa.Save()
        '    Next
        'End If

        'BAP
        'Dim objBAPDet As New XPCollection(Of HOBAPDetail)(session1)
        'Dim objTT As New XPCollection(Of HOBAPDetail)(session1, New BinaryOperator("HOBAPID.HOID.HOID", idLama))
        'objBAPDet = objTT
        'If Not objBAPDet.Count = 0 Then
        '    For x As Integer = 0 To objBAPDet.Count - 1
        '        Dim nSaran As New HOBAPDetail(session1)
        '        nSaran = objBAPDet.Object(x)
        '        nSaran.HOBAPDetailID = Guid.NewGuid
        '        nSaran.HOBAPID.HOID = session1.FindObject(Of HO)(New BinaryOperator("HOID", idBaru))
        '        nSaran.Save()
        '    Next
        'End If

    End Sub

    Private Sub IsiChildSIUP(ByVal idLama As Guid, ByVal idBaru As Guid)
        'SIUPbank
        Dim obj As New XPCollection(Of SIUPbank)(session1)
        Dim bankLama As New XPCollection(Of SIUPbank)(session1, New BinaryOperator("SIUPID", idlama))
        obj = bankLama
        If Not obj.Count = 0 Then
            For x As Integer = 0 To obj.Count - 1
                Dim nObj As New SIUPbank(session1)
                nObj = obj.Object(x)
                nObj.SIUPBankID = Guid.NewGuid
                nObj.SIUPID = session1.FindObject(Of SIUP)(New BinaryOperator("SIUPID", idbaru))
                nObj.Save()
            Next
        End If

        'KLUI
        Dim objKLUI As New XPCollection(Of SIUPJenisKLUI)(session1)
        Dim JenisKLUILama As New XPCollection(Of SIUPJenisKLUI)(session1, New BinaryOperator("SIUPID", idlama))
        objKLUI = JenisKLUILama
        If Not objKLUI.Count = 0 Then
            Try
                For x As Integer = 0 To obj.Count - 1
                    Dim nObj As New SIUPJenisKLUI(session1)
                    nObj = objKLUI.Object(x)
                    nObj.SIUPJENISKLUIID = Guid.NewGuid
                    nObj.SIUPID = session1.FindObject(Of SIUP)(New BinaryOperator("SIUPID", idbaru))
                    nObj.Save()
                Next
            Catch ex As Exception

            End Try
        End If
        ''Maksud
        Dim objMaksudDetal As New XPCollection(Of SIUPMaksudDetal)(session1)
        Dim JenisMaksudDetalLama As New XPCollection(Of SIUPMaksudDetal)(session1, New BinaryOperator("SIUPID", idlama))
        objMaksudDetal = JenisMaksudDetalLama
        If Not objMaksudDetal.Count = 0 Then
            For x As Integer = 0 To obj.Count - 1
                Dim nObj As New SIUPMaksudDetal(session1)
                nObj = objMaksudDetal.Object(x)
                nObj.SIUPMaksudDetailID = Guid.NewGuid
                nObj.SIUPID = session1.FindObject(Of SIUP)(New BinaryOperator("SIUPID", idbaru))
                nObj.Save()
            Next
        End If
    End Sub

    'Private Function cekPembaruanTDP() As Boolean
    '    Dim noijin As String = tdpIzinLamaASPxTextBox.Text.ToString.Trim
    '    Dim izinID As JenisIzin = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinID", tdpJenisASPxComboBox.Value))
    '    Dim query As CriteriaOperator = CriteriaOperator.Parse("NoIjin='" & noijin & "' And JenisIzinID='" & izinID.JenisIzinID.ToString & "'")
    '    Dim obj As TDP = session1.FindObject(Of TDP)(query)
    '    If obj Is Nothing Then
    '        Return False
    '    Else
    '        Return True
    '    End If
    'End Function

#End Region

#Region " Combobox SelectedIndexChanged "

    Protected Sub imbASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles imbASPxComboBox.SelectedIndexChanged
        Dim cb As ASPxComboBox = TryCast(sender, ASPxComboBox)

        'Bandingkan()
        If Not cb.SelectedItem.Text = "Baru" Then
            imbIzinLamaASPxLabel.Visible = True
            imbIzinLamaASPxTextBox.Visible = True
        Else
            imbIzinLamaASPxLabel.Visible = False
            imbIzinLamaASPxTextBox.Visible = False
        End If
    End Sub

    Protected Sub lokasiASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lokasiASPxComboBox.SelectedIndexChanged
        Dim cb As ASPxComboBox = TryCast(sender, ASPxComboBox)
    End Sub

    Protected Sub iuiASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles iuiASPxComboBox.SelectedIndexChanged
        Dim cb As ASPxComboBox = TryCast(sender, ASPxComboBox)
        Bandingkan()
        If Not cb.SelectedItem.Text = "Baru" Then
            iuiLamaASPxLabel.Visible = True
            iuiLamaASPxTextBox.Visible = True
        Else
            iuiLamaASPxLabel.Visible = False
            iuiLamaASPxTextBox.Visible = False
        End If
    End Sub

    'Protected Sub IPTASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles iptASPxComboBox.SelectedIndexChanged
    '    Dim cb As ASPxComboBox = TryCast(sender, ASPxComboBox)
    '    Bandingkan()
    '    If Not cb.SelectedItem.Text = "Baru" Then
    '        IPTLamaASPxLabel.Visible = True
    '        IPTLamaASPxTextBox.Visible = True
    '    Else
    '        IPTLamaASPxLabel.Visible = False
    '        IPTLamaASPxTextBox.Visible = False
    '    End If
    'End Sub

    Protected Sub IPIASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles IPIASPxComboBox.SelectedIndexChanged
        Dim cb As ASPxComboBox = TryCast(sender, ASPxComboBox)
        Bandingkan()
        If Not cb.SelectedItem.Text = "Baru" Then
            IPILamaASPxLabel.Visible = True
            IPILamaASPxTextBox.Visible = True
        Else
            IPILamaASPxLabel.Visible = False
            IPILamaASPxTextBox.Visible = False
        End If
    End Sub

    Protected Sub hoASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles hoASPxComboBox.SelectedIndexChanged
        Bandingkan()
        If Not hoASPxComboBox.Text = "Baru" Then
            'hoASPxTextBoxIzinLama.Visible = True
            hoASPxButtonIzinLama.Visible = True
        Else
            'hoASPxTextBoxIzinLama.Visible = False
            hoASPxButtonIzinLama.Visible = False
        End If
        Session("JenisIzinHO") = Nothing
    End Sub

    Protected Sub TDIASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TDIASPxComboBox.SelectedIndexChanged
        Dim cb As ASPxComboBox = TryCast(sender, ASPxComboBox)
        Bandingkan()
        If Not cb.SelectedItem.Text = "Baru" Then
            TDILamaASPxLabel.Visible = True
            TDILamaASPxTextBox.Visible = True
        Else
            TDILamaASPxLabel.Visible = False
            TDILamaASPxTextBox.Visible = False
        End If
    End Sub

    Protected Sub siupASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles siupASPxComboBox.SelectedIndexChanged
        If Not siupASPxComboBox.Text = "Baru" Then
            siupIzinLamaASPxTextBox.Visible = True
        Else
            siupIzinLamaASPxTextBox.Visible = False
        End If
        Session("JenisIzinSIUP") = Nothing
    End Sub

    Protected Sub siupJenisASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles siupJenisASPxComboBox.SelectedIndexChanged
        siupASPxComboBox.SelectedIndex = -1

        Session("JenisIzinSIUP") = siupJenisASPxComboBox.Value
        siupASPxComboBox.DataBind()
    End Sub

    'Protected Sub tdpASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles tdpASPxComboBox.SelectedIndexChanged
    '    If Not tdpASPxComboBox.Text = "Baru" Then
    '        tdpIzinLamaASPxTextBox.Visible = True
    '    Else
    '        tdpIzinLamaASPxTextBox.Visible = False
    '    End If
    '    Session("JenisIzinTDP") = Nothing
    'End Sub

    'Protected Sub tdpJenisASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles tdpJenisASPxComboBox.SelectedIndexChanged
    '    tdpASPxComboBox.SelectedIndex = -1

    '    Session("JenisIzinTDP") = tdpJenisASPxComboBox.Value
    '    tdpJenisASPxComboBox.DataBind()
    'End Sub

#End Region

#Region " Binding Syarat "

    Private Sub Bandingkan()
        Dim syaratList As New List(Of SyaratIzin)
        SyaratIMB(syaratList)
        SyaratLokasi(syaratList)
        SyaratIUI(syaratList)
        'SyaratIPT(syaratList)
        SyaratIPI(syaratList)
        SyaratTDI(syaratList)
        SyaratHO(syaratList)
        SyaratSIUP(syaratList)
        'SyaratTDP(syaratList)
        buatCriteria(syaratList)
        syaratIzinASPxGridView.DataBind()
    End Sub

    Protected Sub buatCriteria(ByVal items As List(Of SyaratIzin))
        Dim sb As New StringBuilder
        Dim firstAttribute As Boolean = True
        Dim x As Integer = 0
        Dim syaratItem As New XPCollection(Of SyaratIzin)(session1)
        items.Sort()
        For Each item As SyaratIzin In items
            x = x + 1
            If firstAttribute Then
                firstAttribute = False
                'sb.Append("[")
            Else
                sb.Append(" OR ")
            End If
            sb.AppendFormat("[{0}]='{1}'", "SyaratIzinID", item.SyaratIzinID.ToString)

        Next item

        'If (Not firstAttribute) Then
        '    sb.Append("]")
        'End If

        Dim criteria As String = sb.ToString()
        If Not String.IsNullOrEmpty(criteria) Then
            syaratIzinXpoDataSource.Criteria = criteria
            syaratIzinXpoDataSource.DataBind()
        End If
    End Sub

    Private Function SyaratIMB(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
        If imbASPxComboBox.Value IsNot Nothing Then
            Dim imbCb As ASPxComboBox = imbASPxComboBox
            Dim imbSyarat As New XPCollection(Of SyaratIzin)(session1, CreateCriteria(imbCb))
            If syaratList.Count = 0 Then
                For x As Integer = 0 To imbSyarat.Count - 1
                    syaratList.Add(imbSyarat.Object(x))
                Next
            End If
            SyaratIMB = syaratList
        End If
    End Function

    Private Function SyaratLokasi(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
        Dim tambah As Boolean = False
        Dim sama As Boolean = False
        If lokasiASPxComboBox.Value IsNot Nothing Then
            Dim lokasiCb As ASPxComboBox = lokasiASPxComboBox
            Dim lokasiSyarat As New XPCollection(Of SyaratIzin)(session1, CreateCriteria(lokasiCb))
            If syaratList.Count = 0 Then
                For x As Integer = 0 To lokasiSyarat.Count - 1
                    syaratList.Add(lokasiSyarat.Object(x))
                Next
            Else
                For x As Integer = 0 To lokasiSyarat.Count - 1
                    For y As Integer = 0 To syaratList.Count - 1
                        If lokasiSyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
                            sama = True
                            Exit For
                        Else
                            If y = syaratList.Count - 1 And sama = False Then
                                tambah = True
                            End If
                        End If
                    Next
                    If tambah = True And sama = False Then
                        syaratList.Add(lokasiSyarat.Object(x))
                    End If
                    sama = False
                Next
            End If
            SyaratLokasi = syaratList
        End If
    End Function

    Private Function SyaratIUI(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
        Dim tambah As Boolean = False
        Dim sama As Boolean = False
        If iuiASPxComboBox.Value IsNot Nothing Then
            Dim iuiCb As ASPxComboBox = iuiASPxComboBox
            Dim iuiSyarat As New XPCollection(Of SyaratIzin)(session1, CreateCriteria(iuiCb))
            If syaratList.Count = 0 Then
                For x As Integer = 0 To iuiSyarat.Count - 1
                    syaratList.Add(iuiSyarat.Object(x))
                Next
            Else
                For x As Integer = 0 To iuiSyarat.Count - 1
                    For y As Integer = 0 To syaratList.Count - 1
                        If iuiSyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
                            sama = True
                            Exit For
                        Else
                            If y = syaratList.Count - 1 And sama = False Then
                                tambah = True
                            End If
                        End If
                    Next
                    If tambah = True And sama = False Then
                        syaratList.Add(iuiSyarat.Object(x))

                    End If
                    sama = False
                Next
            End If

            SyaratIUI = syaratList
        End If

    End Function

    'Private Function SyaratIPT(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
    '    Dim tambah As Boolean = False
    '    Dim sama As Boolean = False
    '    If iptASPxComboBox.Value IsNot Nothing Then
    '        Dim IPTCb As ASPxComboBox = iptASPxComboBox
    '        Dim IPTSyarat As New XPCollection(Of SyaratIzin)(session1, CreateCriteria(IPTCb))
    '        If syaratList.Count = 0 Then
    '            For x As Integer = 0 To IPTSyarat.Count - 1
    '                syaratList.Add(IPTSyarat.Object(x))
    '            Next
    '        Else
    '            For x As Integer = 0 To IPTSyarat.Count - 1
    '                For y As Integer = 0 To syaratList.Count - 1
    '                    If IPTSyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
    '                        sama = True
    '                        Exit For
    '                    Else
    '                        If y = syaratList.Count - 1 And sama = False Then
    '                            tambah = True
    '                        End If
    '                    End If
    '                Next

    '                If tambah = True And sama = False Then
    '                    syaratList.Add(IPTSyarat.Object(x))
    '                End If
    '                sama = False
    '            Next
    '        End If
    '        sama = False
    '        SyaratIPT = syaratList
    '    End If
    'End Function

    Private Function SyaratIPI(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
        Dim tambah As Boolean = False
        Dim sama As Boolean = False
        If IPIASPxComboBox.Value IsNot Nothing Then
            Dim IPICb As ASPxComboBox = IPIASPxComboBox
            Dim IPISyarat As New XPCollection(Of SyaratIzin)(session1, CreateCriteria(IPICb))
            If syaratList.Count = 0 Then
                For x As Integer = 0 To IPISyarat.Count - 1
                    syaratList.Add(IPISyarat.Object(x))
                Next
            Else
                For x As Integer = 0 To IPISyarat.Count - 1
                    For y As Integer = 0 To syaratList.Count - 1
                        If IPISyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
                            sama = True
                            Exit For
                        Else
                            If y = syaratList.Count - 1 And sama = False Then
                                tambah = True
                            End If
                        End If
                    Next
                    If tambah = True And sama = False Then
                        syaratList.Add(IPISyarat.Object(x))
                    End If
                    sama = False
                Next
            End If

        End If
        SyaratIPI = syaratList
    End Function

    Private Function SyaratTDI(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
        Dim tambah As Boolean = False
        Dim sama As Boolean = False
        If TDIASPxComboBox.Value IsNot Nothing Then
            Dim TDICb As ASPxComboBox = TDIASPxComboBox
            Dim TDISyarat As New XPCollection(Of SyaratIzin)(session1, CreateCriteria(TDICb))
            If syaratList.Count = 0 Then
                For x As Integer = 0 To TDISyarat.Count - 1
                    syaratList.Add(TDISyarat.Object(x))
                Next
            Else
                For x As Integer = 0 To TDISyarat.Count - 1
                    For y As Integer = 0 To syaratList.Count - 1
                        If TDISyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
                            sama = True
                            Exit For
                        Else
                            If y = syaratList.Count - 1 And sama = False Then
                                tambah = True
                            End If
                        End If
                    Next
                    If tambah = True And sama = False Then
                        syaratList.Add(TDISyarat.Object(x))
                    End If
                    sama = False
                Next
            End If

        End If
        SyaratTDI = syaratList
    End Function

    Private Function SyaratHO(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
        Dim tambah As Boolean = False
        Dim sama As Boolean = False
        If hoASPxComboBox.Value IsNot Nothing Then
            Dim HOCb As ASPxComboBox = hoASPxComboBox
            Dim HOSyarat As New XPCollection(Of SyaratIzin)(session1, CreateCriteria(HOCb))
            If syaratList.Count = 0 Then
                For x As Integer = 0 To HOSyarat.Count - 1
                    syaratList.Add(HOSyarat.Object(x))
                Next
            Else
                For x As Integer = 0 To HOSyarat.Count - 1
                    For y As Integer = 0 To syaratList.Count - 1
                        If HOSyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
                            sama = True
                            Exit For
                        Else
                            If y = syaratList.Count - 1 And sama = False Then
                                tambah = True
                            End If
                        End If
                    Next
                    If tambah = True And sama = False Then
                        syaratList.Add(HOSyarat.Object(x))
                    End If
                    sama = False
                Next
            End If

        End If
        SyaratHO = syaratList
    End Function

    Private Function SyaratSIUP(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
        Dim tambah As Boolean = False
        Dim sama As Boolean = False
        If siupASPxComboBox.Value IsNot Nothing Then
            Dim SIUPCb As ASPxComboBox = siupASPxComboBox
            Dim SIUPSyarat As New XPCollection(Of SyaratIzin)(session1, CriteriaOperator.Parse("JenisIzinID='" & siupJenisASPxComboBox.Value.ToString & "' And JenisPermohonanIzinID='" & siupASPxComboBox.Value.ToString & "'"))
            If syaratList.Count = 0 Then
                For x As Integer = 0 To SIUPSyarat.Count - 1
                    syaratList.Add(SIUPSyarat.Object(x))
                Next
            Else
                For x As Integer = 0 To SIUPSyarat.Count - 1
                    For y As Integer = 0 To syaratList.Count - 1
                        If SIUPSyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
                            sama = True
                            Exit For
                        Else
                            If y = syaratList.Count - 1 And sama = False Then
                                tambah = True
                            End If
                        End If
                    Next
                    If tambah = True And sama = False Then
                        syaratList.Add(SIUPSyarat.Object(x))
                    End If
                Next
            End If
            sama = False
        End If
        SyaratSIUP = syaratList
    End Function

    'Private Function SyaratTDP(ByVal syaratList As List(Of SyaratIzin)) As List(Of SyaratIzin)
    '    Dim tambah As Boolean = False
    '    Dim sama As Boolean = False
    '    If tdpASPxComboBox.Value IsNot Nothing Then
    '        Dim TDPCb As ASPxComboBox = tdpASPxComboBox
    '        Dim TDPSyarat As New XPCollection(Of SyaratIzin)(session1, CriteriaOperator.Parse("JenisIzinID='" & tdpJenisASPxComboBox.Value.ToString & "' And JenisPermohonanIzinID='" & tdpASPxComboBox.Value.ToString & "'"))
    '        If syaratList.Count = 0 Then
    '            For x As Integer = 0 To TDPSyarat.Count - 1
    '                syaratList.Add(TDPSyarat.Object(x))
    '            Next
    '        Else
    '            For x As Integer = 0 To TDPSyarat.Count - 1
    '                For y As Integer = 0 To syaratList.Count - 1
    '                    If TDPSyarat.Object(x).MasterDataSyaratID.Equals(syaratList.Item(y).MasterDataSyaratID) Then
    '                        sama = True
    '                        Exit For
    '                    Else
    '                        If y = syaratList.Count - 1 And sama = False Then
    '                            tambah = True
    '                        End If
    '                    End If
    '                Next
    '                If tambah = True And sama = False Then
    '                    syaratList.Add(TDPSyarat.Object(x))
    '                End If
    '            Next
    '        End If
    '        sama = False
    '    End If
    '    SyaratTDP = syaratList
    'End Function

    Protected Sub syaratIzinASPxGridView_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs) Handles syaratIzinASPxGridView.CustomCallback
        Bandingkan()
        imbIzinLamaASPxLabel.Visible = True
        'syaratIzinASPxGridView.SortBy(syaratIzinASPxGridView.Columns("MasterDataSyaratID!Key"), DevExpress.Data.ColumnSortOrder.Ascending)
        ASPxCallback3.DataBind()
    End Sub

    Private Function CreateCriteria(ByVal cb As ASPxComboBox) As CriteriaOperator
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("JenisPermohonanIzinID = '" + cb.SelectedItem.Value.ToString + "'")
        Return criteria
    End Function

#End Region

#Region " Daftar Ulang HO "

    Protected Sub GridButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridButton.Click
        BikinDaftarUlangHO()
    End Sub

#End Region

#Region " TDP Ga Pake "

    '#Region " Simpan Pembaruan "

    '    Private Function PembaruanTDP(ByVal noIzin As String) As TDP
    '        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NoIjin='" & noIzin & "' And JenisIzinID='" & tdpJenisASPxComboBox.Value.ToString & "'")
    '        Dim obj As TDP = DirectCast(session1.FindObject(GetType(TDP), query1), TDP)
    '        If obj IsNot Nothing Then
    '            PembaruanTDP = obj
    '        Else
    '            PembaruanTDP = Nothing
    '        End If
    '    End Function

    '    Private Sub IsiChildTDP(ByVal idLama As Guid, ByVal idBaru As Guid)
    '        'TDPbank
    '        Dim obj As New XPCollection(Of TDPbank)(session1)
    '        Dim bankLama As New XPCollection(Of TDPbank)(session1, New BinaryOperator("TDPID", idLama))
    '        obj = bankLama
    '        If Not obj.Count = 0 Then
    '            For x As Integer = 0 To obj.Count - 1
    '                Dim nObj As New TDPbank(session1)
    '                nObj = obj.Object(x)
    '                nObj.TDPBankID = Guid.NewGuid
    '                nObj.TDPID = session1.FindObject(Of TDP)(New BinaryOperator("TDPID", idBaru))
    '                nObj.Save()
    '            Next
    '        End If

    '        'KLUI
    '        Dim objKLUI As New XPCollection(Of TDPJenisKLUI)(session1)
    '        Dim JenisKLUILama As New XPCollection(Of TDPJenisKLUI)(session1, New BinaryOperator("TDPID", idLama))
    '        objKLUI = JenisKLUILama
    '        If Not objKLUI.Count = 0 Then
    '            For x As Integer = 0 To obj.Count - 1
    '                Dim nObj As New TDPJenisKLUI(session1)
    '                nObj = objKLUI.Object(x)
    '                nObj.TDPJENISKLUIID = Guid.NewGuid
    '                nObj.TDPID = session1.FindObject(Of TDP)(New BinaryOperator("TDPID", idBaru))
    '                nObj.Save()
    '            Next
    '        End If
    '        ''Maksud
    '        Dim objMaksudDetal As New XPCollection(Of TDPMaksudDetal)(session1)
    '        Dim JenisMaksudDetalLama As New XPCollection(Of TDPMaksudDetal)(session1, New BinaryOperator("TDPID", idLama))
    '        objMaksudDetal = JenisMaksudDetalLama
    '        If Not objMaksudDetal.Count = 0 Then
    '            For x As Integer = 0 To obj.Count - 1
    '                Dim nObj As New TDPMaksudDetal(session1)
    '                nObj = objMaksudDetal.Object(x)
    '                nObj.TDPMaksudDetailID = Guid.NewGuid
    '                nObj.TDPID = session1.FindObject(Of TDP)(New BinaryOperator("TDPID", idBaru))
    '                nObj.Save()
    '            Next
    '        End If
    '    End Sub

    '#End Region

#End Region

    Protected Sub ASPxCallback3_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxCallback3.DataBinding
        ASPxCallback3.ClientSideEvents.BeginCallback.ToString()
    End Sub

    Private Function CheckSyaratIzin() As Boolean
        Dim gv As ASPxGridView = syaratIzinASPxGridView
        If gv.VisibleRowCount = gv.Selection.Count Then
            Return True
        Else
            syaratIzinASPxPopupControl.ShowOnPageLoad = True
            Return False
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Bandingkan()
        If Not IsPostBack Then
            tanggalPermohonanASPxDateEdit.Date = DateTime.Today
            Session("JenisPermohonanIzinID") = Nothing
        End If
    End Sub

End Class
