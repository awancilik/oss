Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports Microsoft.VisualBasic
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Xpo.DB
Imports DevExpress.Web.Data
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxClasses
Imports Bisnisobjek.OSS
Imports Bisnisobjek.OSS.HOJenisUsaha

Partial Class Utility_HO
    Inherits System.Web.UI.Page

#Region " Xpo "
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        XpoDataSourceHO.Session = session1
        XpoDataSourceKabupaten.Session = session1
        XpoDataSourcePropinsi.Session = session1
        XpoDataSourceJenisUsaha.Session = session1
        XpoDataSourceHOAlat.Session = session1
        XpoDataSourceEnergi.Session = session1
        XpoDataSourceIL.Session = session1
        XpoDataSourceIG.Session = session1
        XpoDataSourceJenisLingkungan.Session = session1
        XpoDataSourceJenisTarifLingkungan.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("HO") = Nothing
        End If
    End Sub
#End Region

#Region " HO "

    Protected Sub ButtonNomorPermohonan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonNomorPermohonan.Click
        Dim noPermohonan As String = TxtNomorPermohonan.Text
        Dim dv As DetailsView = DataHODetailView
        If cekPermohonan(noPermohonan) = True Then
            dv.Visible = True
            dv.ChangeMode(DetailsViewMode.Edit)
        ElseIf TxtNomorPermohonan.Text IsNot Nothing Then
            PopupControlPeringatan.ShowOnPageLoad = True
        End If
    End Sub

    Private Function cekPermohonan(ByVal nopermohonan As String) As Boolean
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & nopermohonan.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        If objPermohonan IsNot Nothing Then
            If cekpd(objPermohonan.PermohonanID.ToString) = True Then
                Return True
            End If
        Else
            Return False
        End If
    End Function

    Private Function cekpd(ByVal permohonanid As String) As Boolean
        Dim criter As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='HO'")
        Dim objJenisIzin As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), criter), JenisIzin)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & _
            "'And JenisIzinID='" & objJenisIzin.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If objPD IsNot Nothing Then
            If cekHO(objPD.PermohonanIzinID.ToString) = True Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function cekHO(ByVal HOID As String) As Boolean
        Dim objHO As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", HOID))
        If objHO IsNot Nothing Then
            Session("HOID") = objHO.HOID.ToString
            Return True
        Else
            Session("HOID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region " DetailViewHO "

    Protected Sub DataHODetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataHODetailView.DataBound
        If DataHODetailView.CurrentMode = DetailsViewMode.Edit Then
            HOEdit()
        End If
    End Sub

    Public Sub HOEdit()
        Dim dv As DetailsView = DataHODetailView
        Dim criter As CriteriaOperator = CriteriaOperator.Parse("HOID='" & Session("HOID").ToString & "'")
        Dim objusaha As HO = DirectCast(session1.FindObject(GetType(HO), criter), HO)
        If dv.CurrentMode = DetailsViewMode.Edit Then
            Dim jenisusaha As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
            Dim tariflingkungan As ASPxComboBox = DirectCast(dv.FindControl("ComboTarifLingkungan"), ASPxComboBox)
            Dim jenistariflingkungan As ASPxComboBox = DirectCast(dv.FindControl("JenisTarifComboBox"), ASPxComboBox)
            Dim kelurahancombo As ASPxComboBox = DirectCast(dv.FindControl("KelurahanPemilikComboBox"), ASPxComboBox)
            Dim kecamatancombo As ASPxComboBox = DirectCast(dv.FindControl("pemilikKecamatanASPxComboBox"), ASPxComboBox)
            Dim cbSewa As ASPxComboBox = DirectCast(dv.FindControl("cbPerjanjianSewa"), ASPxComboBox)
            If CStr(Session("TanahMilik")) IsNot Nothing Then
                cbSewa.Value = CStr(Session("TanahMilik"))
                cbSewa.Text = CStr(Session("TanahMilik"))
                cbSewa.DataBind()
            Else
                If objusaha.TanahMilik IsNot Nothing Then
                    cbSewa.Value = objusaha.HOID
                    cbSewa.Text = objusaha.TanahMilik
                    cbSewa.DataBind()
                End If
            End If
            If CStr(Session("KecamatanID")) IsNot Nothing Then
                kecamatancombo.Value = CStr(Session("KecamatanID"))
                kecamatancombo.Text = CStr(Session("KecamatanNama"))
                kecamatancombo.DataBind()
            Else
                If objusaha.PemilikKelurahanID IsNot Nothing Then
                    kelurahancombo.Value = objusaha.PemilikKelurahanID.ToString
                    kelurahancombo.Text = objusaha.PemilikKelurahanID.KelurahanNama
                    kelurahancombo.DataBind()
                End If
                If CStr(Session("KelurahanID")) IsNot Nothing Then
                    kelurahancombo.Value = CStr(Session("KelurahanID"))
                    kelurahancombo.Text = CStr(Session("KelurahanNama"))
                    kelurahancombo.DataBind()
                Else
                    If objusaha.PemilikKecamatanID IsNot Nothing Then
                        kecamatancombo.Value = objusaha.PemilikKecamatanID.ToString
                        kecamatancombo.Text = objusaha.PemilikKecamatanID.KecamatanNama
                        kecamatancombo.DataBind()
                    End If

                    If CStr(Session("JenisUsahaID")) IsNot Nothing Then
                        jenisusaha.Value = CStr(Session("JenisUsahaID"))
                        jenisusaha.Text = CStr(Session("JenisUsaha"))
                        jenisusaha.DataBind()
                    Else
                        If objusaha.JenisUsahaID IsNot Nothing Then
                            jenisusaha.Value = objusaha.JenisUsahaID.ToString
                            jenisusaha.Text = objusaha.JenisUsahaID.JenisUsaha
                            jenisusaha.DataBind()
                        End If
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub DataHODetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DataHODetailView.ItemUpdated
        DataHODetailView.Visible = False
        ASPxPopupControlSimpan.ShowOnPageLoad = True
    End Sub

    Protected Sub DataHODetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DataHODetailView.ItemUpdating
        Dim dv As DetailsView = DataHODetailView
        Dim criter As CriteriaOperator = CriteriaOperator.Parse("HOID='" & Session("HOID").ToString & "'")
        Dim objusaha As HO = DirectCast(session1.FindObject(GetType(HO), criter), HO)
        Dim lamasewatxt As ASPxTextBox = DirectCast(dv.FindControl("TahunSewaTextBox"), ASPxTextBox)
        Dim lokasiusaha As ASPxMemo = DirectCast(dv.FindControl("LokasiTextBox"), ASPxMemo)
        Dim alamatpemilik As ASPxMemo = DirectCast(dv.FindControl("AlamatPemilikMemo"), ASPxMemo)
        Dim cbsewa As ASPxComboBox = DirectCast(dv.FindControl("cbPerjanjianSewa"), ASPxComboBox)
        Dim jenistaripid As String = CStr(Session("TaripLingkunganID"))
        Dim jenislingkungannid As String = CStr(Session("JenisLingkunganID"))
        Dim jenisusahaid As String = CStr(Session("JenisUsaha"))
        Dim kecamatanid As String = CStr(Session("KecamatanID"))
        Dim kelurahanid As String = CStr(Session("KelurahanID"))
        If cbsewa IsNot Nothing Then
            e.NewValues.Item("TanahMilik") = Session("TanahMilik")
            e.NewValues.Item("TanahMilik") = cbsewa.Text
        End If
        If lokasiusaha.Text = "" Then
            e.NewValues.Item("LokasiUsaha") = Session("LokasiUsaha")
            e.NewValues.Item("LokasiUsaha") = alamatpemilik.Text
        End If
        If kecamatanid IsNot Nothing Then
            objusaha.PemilikKecamatanID = DirectCast(session1.GetObjectByKey(GetType(Kecamatan), New Guid(kecamatanid.ToString)), Kecamatan)
        End If
        If kelurahanid IsNot Nothing Then
            objusaha.PemilikKelurahanID = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), New Guid(kelurahanid.ToString)), Kelurahan)
        End If
        If CStr(Session("kelurahanID")) IsNot Nothing Then
            Dim kelurahan As CriteriaOperator = CriteriaOperator.Parse("KelurahanID='" & Session("kelurahanID").ToString & "'")
            objusaha.PemilikKelurahanID = DirectCast(session1.FindObject(GetType(Kelurahan), kelurahan), Kelurahan)
        End If
        If CStr(Session("kecamatanID")) IsNot Nothing Then
            Dim kecamatan As CriteriaOperator = CriteriaOperator.Parse("KecamatanID='" & Session("kecamatanID").ToString & "'")
            objusaha.PemilikKecamatanID = DirectCast(session1.FindObject(GetType(Kecamatan), kecamatan), Kecamatan)
        End If
        'JenisUsaha
        If jenisusahaid IsNot Nothing Then
            objusaha.JenisUsahaID = DirectCast(session1.GetObjectByKey(GetType(HOJenisUsaha), New Guid(jenisusahaid.ToString)), HOJenisUsaha)
        End If
        If CStr(Session("jenisUsahaID")) IsNot Nothing Then
            Dim usaha As CriteriaOperator = CriteriaOperator.Parse("JenisUsahaID='" & Session("jenisUsahaID").ToString & "'")
            objusaha.JenisUsahaID = DirectCast(session1.GetObjectByKey(GetType(HOJenisUsaha), usaha), HOJenisUsaha)
        End If
        'End Jenis Usaha

        'TaripLingkngan
        If jenistaripid IsNot Nothing Then
            objusaha.TaripLingkunganID = DirectCast(session1.GetObjectByKey(GetType(HOTaripLingkungan), New Guid(jenistaripid.ToString)), HOTaripLingkungan)
        End If
        If CStr(Session("taripLingkunganID")) IsNot Nothing Then
            Dim taripling As CriteriaOperator = CriteriaOperator.Parse("TaripLingkunganID='" & Session("taripLingkunganID").ToString & "'")
            objusaha.TaripLingkunganID = DirectCast(session1.GetObjectByKey(GetType(HOTaripLingkungan), taripling), HOTaripLingkungan)
        End If
        'End TaripLingkungan

        'Jenis Lingkungan
        If jenislingkungannid IsNot Nothing Then
            objusaha.JenisLingkunganID = DirectCast(session1.GetObjectByKey(GetType(HOJenisLingkungan), New Guid(jenislingkungannid.ToString)), HOJenisLingkungan)
        End If
        If CStr(Session("jenisLingkunganID")) IsNot Nothing Then
            Dim jenisling As CriteriaOperator = CriteriaOperator.Parse("JenisLingkunganID='" & Session("jenisLingkunganID").ToString & "'")
            objusaha.JenisLingkunganID = DirectCast(session1.GetObjectByKey(GetType(HOJenisLingkungan), jenisling), HOJenisLingkungan)
        End If
        If Not lamasewatxt Is Nothing Then
            e.NewValues.Item("LamaSewa") = Session("LamaSewa")
            e.NewValues.Item("LamaSewa") = lamasewatxt.Text
        End If

        'End Jenis Lingkungan
        objusaha.Save()
    End Sub

#End Region

#Region " CallbackJenisUsaha "

    Protected Sub CallbackJenis_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles CallbackJenis.Callback
        Session("JenisUsaha") = e.Parameter
    End Sub

    Protected Sub CallbackJenis_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("JenisUsaha") = e.Parameter
        Dim dv As DetailsView = DataHODetailView
        Dim jenisusahacombo As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
        If jenisusahacombo IsNot Nothing Then
            jenisusahacombo.DataBind()
        End If
    End Sub

    Protected Sub JenisComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dv As DetailsView = DataHODetailView
        Dim cb As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
        Session("JenisUsaha") = cb.SelectedItem.Value
        cb.DataBind()
    End Sub

    Protected Sub KelurahanASPxCallback_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles KelurahanASPxCallback.Callback
        Session("KelurahanID") = e.Parameter
    End Sub

    Protected Sub KelurahanASPxCallback_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanID") = e.Parameter
        Dim dv As DetailsView = DataHODetailView
        Dim kecamatancombo As ASPxComboBox = DirectCast(dv.FindControl("KecamatanPemilikComboBox"), ASPxComboBox)
        Dim kelurahanCombobox As ASPxComboBox = DirectCast(dv.FindControl("KelurahanPemilikComboBox"), ASPxComboBox)
        If kelurahanCombobox IsNot Nothing Then
            kelurahanCombobox.DataBind()
        End If
        If kecamatancombo IsNot Nothing Then
            kecamatancombo.DataBind()
        End If
    End Sub

#End Region

#Region " GridView "
    Protected Sub ASPxGridViewAlat_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("HOID!Key") = Session("HOID").ToString
    End Sub
#End Region

#Region " combobox "

    'Protected Sub cbPerjanjianSewa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim dv As DetailsView = DataHODetailView
    '    Dim cbPerjanjian As ASPxComboBox = DirectCast(dv.FindControl("cbPerjanjianSewa"), ASPxComboBox)
    '    Dim lamasewa As ASPxTextBox = DirectCast(dv.FindControl("TahunSewaTextBox"), ASPxTextBox)
    '    If Not cbPerjanjian.Text = "Sendiri" Then
    '        lamasewa.Visible = True
    '    Else
    '        lamasewa.Visible = False
    '    End If
    'End Sub

#End Region

End Class
