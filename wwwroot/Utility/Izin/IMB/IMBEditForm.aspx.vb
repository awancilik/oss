Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxTabControl
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_IMBEditForm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("IMBID") = Nothing
            Session("KabupatenID") = Nothing
            Session("KecamatanID") = Nothing
            Session("Kecamatan") = Nothing
            Session("Kelurahan") = Nothing
            Session("PerusahaanKabupatenID") = Nothing
            Session("PerusahaanKecamatanID") = Nothing
            Session("PerusahaanKecamatanID") = Nothing
            Session("TujuanID") = Nothing
            Session("PelaksanaID") = Nothing
            Session("statusTanahID") = Nothing
            Session("jenisBangunanID") = Nothing
            Session("lksKelurahanID") = Nothing
        End If
    End Sub

#Region " Xpo "
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        imbXpoDataSource.Session = session1
        imbLantaiXpoDataSource.Session = session1
        KabupatenXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        PerusahaanKecamatanXpoDataSource.Session = session1
        PerusahaanKelurahanXpoDataSource.Session = session1
        lokasiKecamatanXpoDataSource.Session = session1
        lokasiKelurahanXpoDataSource.Session = session1
        TujuanIMBXpoDataSource.Session = session1
        PelaksanaXpoDataSource.Session = session1
        StatusTanahXpoDataSource.Session = session1
        JenisBangunanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#End Region

#Region " IMB "
    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            If CheckIMB(objPermohonan) Then
                imbDetailsView.ChangeMode(DetailsViewMode.Edit)
                imbDetailsView.DataBind()
            End If
        Else
            Session("PermohonanID") = Nothing
            imbDetailsView.DataBind()
        End If
    End Sub

    Private Function CheckIMB(ByVal obj As Permohonan) As Boolean
        Dim imbCriteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama = 'IMB'")
        Dim imbIzin As JenisIzin = TryCast(session1.FindObject(GetType(JenisIzin), imbCriteria), JenisIzin)
        If imbIzin IsNot Nothing Then
            Dim detailCriteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & obj.PermohonanID.ToString & "' AND JenisIzinID = '" & imbIzin.JenisIzinID.ToString & "'")
            Dim detailObj As PermohonanDetail = TryCast(session1.FindObject(GetType(PermohonanDetail), detailCriteria), PermohonanDetail)
            If detailObj IsNot Nothing Then
                Session("IMBID") = detailObj.PermohonanIzinID
                Return True
            Else
                Session("IMBID") = Nothing
                notFoundASPxPopupControl.ShowOnPageLoad = True
                Return False
            End If
        End If
    End Function
#End Region

#Region " GridView "
    Protected Sub BangunanTambahanASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IMBID") = Session("IMBID")
    End Sub
#End Region

#Region " ComboBox "
    Protected Sub lokasiKelurahanASPxComboBox_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        'Dim obj As IMB = DirectCast(session1.GetObjectByKey(GetType(IMB), Session("IMBID")), IMB)
        'Dim kel As Kelurahan = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), obj.lksKelurahanID), Kelurahan)
        'If kel IsNot Nothing Then
        '    cb.Value = kel.KelurahanNama
        'End If
    End Sub

    Protected Sub perusahaanKabupatenASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        Session("PerusahaanKabupatenID") = cb.SelectedItem.Value
        Dim dv As DetailsView = imbDetailsView
        If dv.FindControl("PerusahaanKecamatanComboBox") IsNot Nothing Then
            Dim kelComboBox As ASPxComboBox = DirectCast(dv.FindControl("PerusahaanKecamatanComboBox"), ASPxComboBox)
            kelComboBox.DataBind()
        End If
    End Sub

    Protected Sub perusahaanKecamatanASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        Session("PerusahaanKecamatanID") = cb.SelectedItem.Value
        Dim dv As DetailsView = imbDetailsView
        If dv.FindControl("PerusahaanKelurahanComboBox") IsNot Nothing Then
            Dim kelComboBox As ASPxComboBox = DirectCast(dv.FindControl("PerusahaanKelurahanComboBox"), ASPxComboBox)
            kelComboBox.DataBind()
        End If
    End Sub

    Protected Sub perusahaanKelurahanASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        Session("PerusahaanKelurahanID") = cb.SelectedItem.Value
    End Sub

    Protected Sub lokasiKelurahanASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        Session("LokasiKelurahanID") = cb.SelectedItem.Value
    End Sub
#End Region

#Region " Detail View "
    Protected Sub imbDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles imbDetailsView.DataBound
        Dim dv As DetailsView = imbDetailsView
        'Dim kabComboBox As ASPxComboBox = DirectCast(dv.FindControl("PemilikKabupatenComboBox"), ASPxComboBox)
        'Dim kecComboBox As ASPxComboBox = DirectCast(dv.FindControl("PemilikKecamatanComboBox"), ASPxComboBox)
        'Dim kelComboBox As ASPxComboBox = DirectCast(dv.FindControl("PemilikKelurahanComboBox"), ASPxComboBox)
        Dim tujuanComboBox As ASPxComboBox = DirectCast(dv.FindControl("PemilikMaksudComboBox"), ASPxComboBox)
        Dim pelaksanaanComboBox As ASPxComboBox = DirectCast(dv.FindControl("PemilikPelaksanaComboBox"), ASPxComboBox)
        Dim statusComboBox As ASPxComboBox = DirectCast(dv.FindControl("bStatusTanahComboBox"), ASPxComboBox)
        Dim jenisBangunanComboBox As ASPxComboBox = DirectCast(dv.FindControl("bJenisBangunanComboBox"), ASPxComboBox)
        'Dim perusahaanKabupatenComboBox As ASPxComboBox = DirectCast(dv.FindControl("PerusahaanKabupatenComboBox"), ASPxComboBox)
        'Dim perusahaanKecamatanComboBox As ASPxComboBox = DirectCast(dv.FindControl("PerusahaanKecamatanComboBox"), ASPxComboBox)
        'Dim perusahaanKelurahanComboBox As ASPxComboBox = DirectCast(dv.FindControl("PerusahaanKelurahanComboBox"), ASPxComboBox)
        Dim lokasiKecamatanComboBox As ASPxComboBox = DirectCast(dv.FindControl("lokasiKecamatanASPxComboBox"), ASPxComboBox)
        Dim lokasiKelurahanComboBox As ASPxComboBox = DirectCast(dv.FindControl("bKelurahanLokasiComboBox"), ASPxComboBox)
        Dim obj As IMB = DirectCast(session1.GetObjectByKey(GetType(IMB), Session("IMBID")), IMB)
        If obj IsNot Nothing Then
            Dim kab As Kabupaten = DirectCast(session1.GetObjectByKey(GetType(Kabupaten), obj.KabupatenID), Kabupaten)
            Dim tuj As IMBtujuan = DirectCast(session1.GetObjectByKey(GetType(IMBtujuan), obj.TujuanID), IMBtujuan)


            Dim kabPerusahaan As Kabupaten = DirectCast(session1.GetObjectByKey(GetType(Kabupaten), obj.PerusahaanKabupatenID), Kabupaten)
            Dim kecPerusahaan As Kecamatan = DirectCast(session1.GetObjectByKey(GetType(Kecamatan), obj.PerusahaanKecamatanID), Kecamatan)
            Dim kelPerusahaan As Kelurahan = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), obj.PerusahaanKelurahanID), Kelurahan)
            Dim kelLokasi As Kelurahan = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), obj.lksKelurahanID), Kelurahan)
            If tujuanComboBox IsNot Nothing And pelaksanaanComboBox IsNot Nothing And statusComboBox IsNot Nothing And jenisBangunanComboBox IsNot Nothing And lokasiKelurahanComboBox IsNot Nothing And lokasiKecamatanComboBox IsNot Nothing Then
                'If kab IsNot Nothing Then
                '    kabComboBox.Value = kab.KabupatenNama
                'End If
                'If kabPerusahaan IsNot Nothing Then
                '    perusahaanKabupatenComboBox.Value = kabPerusahaan.KabupatenNama
                'End If
                'If kecPerusahaan IsNot Nothing Then
                '    perusahaanKecamatanComboBox.Value = kecPerusahaan.KecamatanNama
                'End If
                'If kelPerusahaan IsNot Nothing Then
                '    perusahaanKelurahanComboBox.Value = kelPerusahaan.KelurahanNama
                'End If
                If kelLokasi IsNot Nothing Then
                    lokasiKecamatanComboBox.Value = kelLokasi.KelurahanKecamatanID.KecamatanNama
                    lokasiKelurahanComboBox.Value = kelLokasi.KelurahanNama
                End If
                'kecComboBox.Value = obj.Kecamatan
                'kelComboBox.Value = obj.Kelurahan
                If tuj IsNot Nothing Then
                    tujuanComboBox.Value = tuj.TujuanIMB
                End If
                Dim pel As IMBpelaksana = DirectCast(session1.GetObjectByKey(GetType(IMBpelaksana), obj.PelaksanaID), IMBpelaksana)
                If pel IsNot Nothing Then
                    pelaksanaanComboBox.Value = pel.Pelaksana
                End If
                If obj.StatusTanahID IsNot Nothing Then
                    Dim status As tanah = DirectCast(session1.GetObjectByKey(GetType(tanah), obj.StatusTanahID.StatusTanahID), tanah)
                    If status IsNot Nothing Then
                        statusComboBox.Value = status.StatusTanah
                    End If
                End If
                If obj.JenisBangunanID IsNot Nothing Then
                    Dim jenisBangunan As IMBbangunan = DirectCast(session1.GetObjectByKey(GetType(IMBbangunan), obj.JenisBangunanID.JenisBangunanID), IMBbangunan)
                    If jenisBangunan IsNot Nothing Then
                        jenisBangunanComboBox.Value = jenisBangunan.JenisBangunan
                    End If
                End If

            End If
        End If
    End Sub

    Protected Sub imbDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles imbDetailsView.ItemInserted
        TersimpanPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub imbDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles imbDetailsView.ItemUpdated
        TersimpanPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub imbDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles imbDetailsView.ItemUpdating
        Dim dv As DetailsView = imbDetailsView
        Dim alamatpemilik As ASPxMemo = DirectCast(dv.FindControl("PemilikAlamatMemo"), ASPxMemo)
        Dim alamatperusahaan As ASPxMemo = DirectCast(dv.FindControl("alamatPerusahaanASPxMemo"), ASPxMemo)
        Dim lokasibangunan As ASPxMemo = DirectCast(dv.FindControl("bLokasiBangunanMemo"), ASPxMemo)
        If alamatpemilik IsNot Nothing Then
            If alamatperusahaan.Text = "" Then
                e.NewValues.Item("PerusahaanAlamat") = Session("Alamat")
                e.NewValues.Item("PerusahaanAlamat") = alamatpemilik.Text
            End If
            If lokasibangunan.Text = "" Then
                e.NewValues.Item("lksAlamat") = Session("Alamat")
                e.NewValues.Item("lksAlamat") = alamatpemilik.Text
            End If
        End If
        If Session("Kelurahan") IsNot Nothing Then
            e.NewValues.Item("Kelurahan") = Session("Kelurahan")
        End If
        If Session("Kecamatan") IsNot Nothing Then
            e.NewValues.Item("Kecamatan") = Session("Kecamatan")
        End If
        If Session("KabupatenID") IsNot Nothing Then
            e.NewValues.Item("KabupatenID") = Session("KabupatenID")
        End If
        If Session("TujuanID") IsNot Nothing Then
            e.NewValues.Item("TujuanID") = Session("TujuanID")
        End If
        If Session("PelaksanaID") IsNot Nothing Then
            e.NewValues.Item("PelaksanaID") = Session("PelaksanaID")
        End If
        If Session("PerusahaanKabupatenID") IsNot Nothing Then
            e.NewValues("PerusahaanKabupatenID") = Session("PerusahaanKabupatenID")
        End If
        If Session("PerusahaanKecamatanID") IsNot Nothing Then
            e.NewValues("PerusahaanKecamatanID") = Session("PerusahaanKecamatanID")
        End If
        If Session("PerusahaanKelurahanID") IsNot Nothing Then
            e.NewValues("PerusahaanKelurahanID") = Session("PerusahaanKelurahanID")
        End If
        If Session("lksKelurahanID") IsNot Nothing Then
            e.NewValues.Item("lksKelurahanID") = Session("lksKelurahanID")
        End If
        If Session("statusTanahID") IsNot Nothing Then
            Dim stat As tanah = TryCast(session1.GetObjectByKey(GetType(tanah), New Guid(Session("statusTanahID").ToString)), tanah)
            If stat IsNot Nothing Then
                e.NewValues.Item("StatusTanahID") = stat
            End If
        End If
        If Session("jenisBangunanID") IsNot Nothing Then
            Dim jenis As IMBbangunan = TryCast(session1.GetObjectByKey(GetType(IMBbangunan), New Guid(Session("jenisBangunanID").ToString)), IMBbangunan)
            If jenis IsNot Nothing Then
                e.NewValues.Item("JenisBangunanID") = jenis
            End If
        End If
        'Dim objIMB As IMB = session1.FindObject(Of IMB)(New BinaryOperator("IMBID", Session("IMBID")))
        'Dim objLog As New TrackingPermohonan(session1)
        'Dim imbCriteria As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama = 'IMB'")
        'Dim imbIzin As JenisIzin = TryCast(session1.FindObject(GetType(JenisIzin), imbCriteria), JenisIzin)
        'objLog.PermohonanLogID = Guid.NewGuid
        'objLog.CreateTime = DateTime.Now
        'objLog.NamaEvent = "Data Izin"
        'objLog.JenisIzinId = imbIzin.JenisIzinID
        'objLog.Save()
        'If objLog IsNot Nothing Then
        '    e.NewValues.Item("PermohonanLogID") = objIMB.PermohonanLogID.PermohonanLogID
        'End If
    End Sub
#End Region

#Region " CallBack "
    Protected Sub pemilikKecamatanASPxComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KabupatenID") = e.Parameter
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

    Protected Sub pemilikKelurahanASPxComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanID") = e.Parameter
        Session("Kecamatan") = DirectCast(session1.GetObjectByKey(GetType(Kecamatan), New Guid(e.Parameter)), Kecamatan).KecamatanNama
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

    Protected Sub pemilikKelurahanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("Kelurahan") = e.Parameter
    End Sub

    Protected Sub perusahaanKecamatanASPxComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("PerusahaanKabupatenID") = e.Parameter
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

    Protected Sub perusahaanKelurahanASPxComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("PerusahaanKecamatanID") = e.Parameter
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

    Protected Sub perusahaanKelurahanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("PerusahaanKelurahanID") = e.Parameter
    End Sub

    Protected Sub tujuanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("TujuanID") = e.Parameter
    End Sub

    Protected Sub pelaksanaASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("PelaksanaID") = e.Parameter
    End Sub

    Protected Sub statusTanahASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("statusTanahID") = e.Parameter
    End Sub

    Protected Sub jenisBangunanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("jenisBangunanID") = e.Parameter
    End Sub

    Protected Sub lokasiKelurahanASPxComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("LokasiKecamatanID") = e.Parameter
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

    Protected Sub lokasiKelurahanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("lksKelurahanID") = e.Parameter
    End Sub
#End Region

    

End Class
