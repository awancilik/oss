Option Explicit On
Option Strict On
Option Compare Text
Imports System
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_HO_HoRetribusi2
    Inherits System.Web.UI.Page
    Private session1 As Session

#Region " Xpo "
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("HOID") = Nothing
            Session("HORetribusi") = Nothing
        End If
        DafUlangDetailsView.Visible = False
        HORetriDetailsView.Visible = False
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        HORetribusiXpoDataSource.Session = session1
        JenisTarifLingkunganXpoDataSource.Session = session1
        TarifLingkunganXpoDataSource.Session = session1
        TarifXpoDataSource.Session = session1
        JenisLokasiXpoDataSource.Session = session1
        IndeksLokasiXpoDataSource.Session = session1
        JenisGangguanXpoDataSource.Session = session1
        IndeksGangguanXpoDataSource.Session = session1
        XpoDataSourceHO.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
#End Region

#Region " Cek Permohonan - PD - Cek HO "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & NoPermohonanASPxTextBox.Text.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & objPermohonan.PermohonanID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If NoPermohonanASPxTextBox.Text.Trim IsNot Nothing Then
            If CekPermohonan(NoPermohonanASPxTextBox.Text.Trim) = True Then
                Dim ret As HORetribusi = session1.FindObject(Of HORetribusi)(New BinaryOperator("HOID", Session("HOID")))
                If ret Is Nothing Then
                    buatret()
                Else
                    cekRet()
                End If
                HORetriDetailsView.Visible = True
                DafUlangDetailsView.Visible = False
                HORetriDetailsView.ChangeMode(DetailsViewMode.Edit)
                HORetriDetailsView.DataBind()
            ElseIf objPermohonan IsNot Nothing Then
                If cekHO2(objPD.PermohonanIzinID.ToString) = True Then
                    Dim ret As HORetribusi = session1.FindObject(Of HORetribusi)(New BinaryOperator("HOID", Session("HOID")))
                    If ret IsNot Nothing Then
                        cekRet()
                    End If
                    If cekJP(objPermohonan.PermohonanID.ToString) = False Then
                        HORetriDetailsView.Visible = False
                        DafUlangDetailsView.Visible = True
                        DafUlangDetailsView.ChangeMode(DetailsViewMode.Edit)
                        DafUlangDetailsView.DataBind()
                    End If
                End If
            End If
        End If
    End Sub

    Private Function CekPermohonan(ByVal noPermohonan As String) As Boolean
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        If objPermohonan IsNot Nothing Then
            If cekJP(objPermohonan.PermohonanID.ToString) = True Then
                If CekPD(objPermohonan.PermohonanID.ToString) = True Then
                    Return True
                End If
            Else
                Return False
            End If
        Else
            ASPxPopupControlKosong.ShowOnPageLoad = True
        End If
    End Function

    Private Function CekPD(ByVal permohonanid As String) As Boolean
        Dim queryCrit As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='HO'")
        Dim izinid As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), queryCrit), JenisIzin)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "' And JenisIzinID='" & izinid.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If objPD IsNot Nothing Then
            If CekHO(objPD.PermohonanIzinID.ToString) = True Then
                Session("Baru") = "Baru"
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function cekJP(ByVal permohonanid As String) As Boolean
        Dim queryCrit2 As CriteriaOperator = CriteriaOperator.Parse("JenisPermohonanIzinID='81B1066B-3A1B-42E8-9664-19AD865CB4F8'")
        Dim jpNama As JenisPermohonanIzin = DirectCast(session1.FindObject(GetType(JenisPermohonanIzin), queryCrit2), JenisPermohonanIzin)
        Dim queryCrit3 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "'And JenisPermohonanIzinID='" _
                                             & jpNama.JenisPermohonanIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), queryCrit3), PermohonanDetail)
        If objPD Is Nothing Then
            Return True
        Else
            Return False
        End If

    End Function

    Private Function CekHO(ByVal HOID As String) As Boolean
        Dim objHO As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", HOID))
        If objHO IsNot Nothing Then
            Session("HOID") = objHO.HOID
            Return True
        Else
            Session("HOID") = Nothing
            Return False
        End If
    End Function

    Private Function cekHO2(ByVal hoid As String) As Boolean
        Dim objho As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", hoid))
        If objho IsNot Nothing Then
            Session("HOID") = objho.HOID
            Return True
        Else
            Session("HOID") = Nothing
            Return False
        End If
    End Function

    Private Sub cekRet()
        Dim obj As HORetribusi = session1.FindObject(Of HORetribusi)(New BinaryOperator("HOID", Session("HOID")))
        Session("HORetribusiID") = obj.HORetribusiID
    End Sub

    Private Sub buatret()
        Dim newRetribusi As New HORetribusi(session1)
        Dim obj As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", Session("HOID")))
        With newRetribusi
            .HORetribusiID = Guid.NewGuid
            .HOID = obj
            .LuasUsaha = CInt(obj.LuasUsaha)
            Session("HORetribusiID") = .HORetribusiID
            .Save()
        End With
    End Sub

#End Region

#Region " Detail View "

#Region " Updating "

    Protected Sub HORetriDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles HORetriDetailsView.ItemUpdating
        Dim rt As New Baca
        Dim bulat As Decimal = Decimal.Zero
        Dim dv As DetailsView = HORetriDetailsView
        Dim objHO As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", Session("HOID")))
        Dim JenisLingkungan As HOJenisLingkungan = session1.FindObject(Of HOJenisLingkungan)(New BinaryOperator("HOJenisLingkunganID", Session("HOJenisLingkunganID")))
        Dim JenisLokasi As HOIndeksLokasi = session1.FindObject(Of HOIndeksLokasi)(New BinaryOperator("HOIndeksLokasiID", Session("HOIndeksLokasiID")))
        Dim JenisGangguan As HOIndeksGangguan = session1.FindObject(Of HOIndeksGangguan)(New BinaryOperator("HOIndeksGangguanID", Session("HOIndeksGangguanID")))
        Dim cbJenisTL As ASPxComboBox = DirectCast(dv.FindControl("JTarifLingkunganASPxComboBox"), ASPxComboBox)
        Dim cbJenisLing As ASPxComboBox = DirectCast(dv.FindControl("JenisLingkunganASPxCombobox"), ASPxComboBox)
        Dim cbTarif As ASPxComboBox = DirectCast(dv.FindControl("TarifASPxCombobox"), ASPxComboBox)
        cbTarif.DisplayFormatString = "c2"
        Dim cbJenisLokasi As ASPxComboBox = DirectCast(dv.FindControl("JenisLokasiASPxComboBox"), ASPxComboBox)
        Dim cbIndeksLokasi As ASPxComboBox = DirectCast(dv.FindControl("IndeksLokasiASPxComboBox"), ASPxComboBox)
        Dim cbJenisGangg As ASPxComboBox = DirectCast(dv.FindControl("JenisGangguanASPxComboBox"), ASPxComboBox)
        Dim cbIndeksGangg As ASPxComboBox = DirectCast(dv.FindControl("IndeksGangguanASPxComboBox"), ASPxComboBox)
        If objHO IsNot Nothing Then
            e.NewValues("HOID") = objHO
        End If
        If JenisLingkungan IsNot Nothing Then
            e.NewValues("JenisTarifLingkungan") = JenisLingkungan.HOTaripJenisID.JenisTaripLingkungan
            e.NewValues("JenisLingkungan") = JenisLingkungan.JenisLingkungan
            e.NewValues("TarifLingkungan") = JenisLingkungan.Tarif
        End If
        If JenisLokasi IsNot Nothing Then
            e.NewValues("JenisLokasi") = JenisLokasi.JenisLokasi
            e.NewValues("IndeksLokasi") = JenisLokasi.Indeks
        End If
        If JenisGangguan IsNot Nothing Then
            e.NewValues("JenisGangguan") = JenisGangguan.JenisGangguan
            e.NewValues("IndeksGangguan") = JenisGangguan.Indeks
        End If
        objHO.Retribusi = Hitung_Retribusi(CDec(cbTarif.Text), CDec(cbIndeksLokasi.Text), CDec(cbIndeksGangg.Text), objHO.LuasUsaha)
        bulat = Decimal.Round(objHO.Retribusi, 0)
        objHO.RetribusiTerbilang = rt.Terbilang(CStr(bulat))
        objHO.Save()
    End Sub

    Private Function Hitung_Retribusi(ByVal TL As Decimal, ByVal IL As Decimal, ByVal IG As Decimal, ByVal LRTU As Decimal) As Decimal
        Hitung_Retribusi = TL * IL * IG * LRTU
    End Function

#End Region

#Region " Updated "

    Protected Sub HORetriDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles HORetriDetailsView.ItemUpdated
        update()
    End Sub

    Public Sub update()
        HORetriDetailsView.Visible = False
        PopupSimpanASPx.ShowOnPageLoad = True
        Session("HORetribusiID") = Nothing
    End Sub


#End Region

#Region " DataBound "

    Protected Sub HORetriDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles HORetriDetailsView.DataBound
        Dim dv As DetailsView = HORetriDetailsView
        kombo_box(dv)
    End Sub

    Private Sub kombo_box(ByVal dv As DetailsView)
        Dim objHO As HO = session1.FindObject(Of HO)(New BinaryOperator("HOID", Session("HOID")))
        If objHO IsNot Nothing Then
            Dim objRet As HORetribusi = session1.FindObject(Of HORetribusi)(New BinaryOperator("HOID", objHO.HOID))
            'Dim tariflingkungan As HOTaripLingkungan = session1.FindObject(Of HOTaripLingkungan)(New BinaryOperator("JenisTaripLingkungan", _
            '                                                       objRet.JenisTarifLingkungan))
            'Dim jenislingkungan As HOJenisLingkungan = session1.FindObject(Of HOJenisLingkungan)(CriteriaOperator.Parse("HOTaripJenisID='" & _
            '                                         tariflingkungan.HOJenisLingkungan.ToString & "'" & _
            '                                         "And Tarif='" & objRet.TarifLingkungan & "'"))
            'kombobox
            Dim labelluas As ASPxLabel = DirectCast(dv.FindControl("LuasASPxLabel"), ASPxLabel)
            Dim JTarifLingkunganASPxComboBox As ASPxComboBox = DirectCast(dv.FindControl("JTarifLingkunganASPxComboBox"), ASPxComboBox)
            Dim JenisLingkunganASPxCombobox As ASPxComboBox = DirectCast(dv.FindControl("JenisLingkunganASPxCombobox"), ASPxComboBox)
            Dim TarifASPxCombobox As ASPxComboBox = DirectCast(dv.FindControl("TarifASPxCombobox"), ASPxComboBox)
            Dim JenisLokasiASPxComboBox As ASPxComboBox = DirectCast(dv.FindControl("JenisLokasiASPxComboBox"), ASPxComboBox)
            Dim IndeksLokasiASPxComboBox As ASPxComboBox = DirectCast(dv.FindControl("IndeksLokasiASPxComboBox"), ASPxComboBox)
            Dim JenisGangguanASPxComboBox As ASPxComboBox = DirectCast(dv.FindControl("JenisGangguanASPxComboBox"), ASPxComboBox)
            Dim IndeksGangguanASPxComboBox As ASPxComboBox = DirectCast(dv.FindControl("IndeksGangguanASPxComboBox"), ASPxComboBox)
            Try
                If objRet IsNot Nothing Then
                    JenisLingkunganASPxCombobox.Value = CStr(Session("JenisLingkunan"))
                    JenisLingkunganASPxCombobox.Text = objRet.JenisLingkungan
                    JenisLingkunganASPxCombobox.DataBind()

                    JTarifLingkunganASPxComboBox.Value = CStr(Session("JenisLingkunan"))
                    JTarifLingkunganASPxComboBox.Text = objRet.JenisTarifLingkungan
                    JTarifLingkunganASPxComboBox.DataBind()

                    JenisLokasiASPxComboBox.Value = CStr(Session("JenisLokasi"))
                    JenisLokasiASPxComboBox.Text = objRet.JenisLokasi
                    JenisLokasiASPxComboBox.DataBind()

                    TarifASPxCombobox.Value = CStr(Session("TarifLingkungan"))
                    TarifASPxCombobox.Text = CStr(objRet.TarifLingkungan)
                    TarifASPxCombobox.DataBind()

                    JenisGangguanASPxComboBox.Value = CStr(Session("JenisGangguan"))
                    JenisGangguanASPxComboBox.Text = objRet.JenisGangguan
                    JenisGangguanASPxComboBox.DataBind()

                    IndeksLokasiASPxComboBox.Value = CStr(Session("IndeksLokasi"))
                    IndeksLokasiASPxComboBox.Text = CStr(objRet.IndeksLokasi)
                    IndeksLokasiASPxComboBox.DataBind()

                    IndeksGangguanASPxComboBox.Value = CStr(Session("IndeksGangguan"))
                    IndeksGangguanASPxComboBox.Text = CStr(objRet.IndeksGangguan)
                    IndeksGangguanASPxComboBox.DataBind()
                End If
                If objHO.HOID.ToString IsNot Nothing Then
                    labelluas.Value = objHO.HOID
                    labelluas.Text = CStr(objHO.LuasUsaha)
                End If
            Catch ex As Exception
            End Try
        End If
    End Sub

#End Region

#End Region

#Region " Callback "

#Region " Jenis Tarif Lingkungan"

    Protected Sub JenisLingkunganComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("HOTaripJenisID") = e.Parameter
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

    Protected Sub TarifASPxComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Dim obj As HOJenisLingkungan = session1.FindObject(Of HOJenisLingkungan)(CriteriaOperator.Parse("HOTaripJenisID='" & Session("HOTaripJenisID").ToString & "'" & _
                                                                                   "And JenisLingkungan='" & e.Parameter & "'"))
        Session("HOJenisLingkunganID") = obj.HOJenisLingkunganID
        TarifXpoDataSource.DataBind()
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

#End Region

#Region " Indeks Lokasi "

    Protected Sub IndeksLokasiComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("HOIndeksLokasiID") = e.Parameter
        IndeksLokasiXpoDataSource.DataBind()
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

#End Region

#Region " Indeks Gangguan "

    Protected Sub IndeksGangguanComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("HOIndeksGangguanID") = e.Parameter
        IndeksLokasiXpoDataSource.DataBind()
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        cb.DataBind()
    End Sub

#End Region

#End Region

#Region " Retribusi Daftar Ulang "

#Region " Detail View "

    Protected Sub TextBoxRetriDaftarUlang_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dv As DetailsView = HORetriDetailsView
        Dim persen As Double = 0.5
        Dim retribusi As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetribusiEdit"), ASPxTextBox)
        Dim retrDaftarUlang As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetriDaftarUlangEdit"), ASPxTextBox)
        Dim RIGdaftarulang As Double = CDbl(retribusi.Text) * persen
        retrDaftarUlang.Text = RIGdaftarulang.ToString
    End Sub

    Protected Sub DafUlangDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DafUlangDetailsView.DataBound
        If HORetriDetailsView.CurrentMode = DetailsViewMode.Edit Then
            Dim dv As DetailsView = HORetriDetailsView
            Dim crit As CriteriaOperator = CriteriaOperator.Parse("HOID='" & Session("HOID").ToString & "'")
            Dim textretri As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetribusiEdit"), ASPxTextBox)
            Dim hoid As HO = DirectCast(session1.FindObject(GetType(HO), crit), HO)
            If textretri IsNot Nothing Then
                textretri.Value = hoid.HOID
                textretri.Text = CStr(hoid.Retribusi)
            Else
                textretri = Nothing
            End If
        End If
    End Sub

    Protected Sub DafUlangDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DafUlangDetailsView.ItemUpdated
        e.NewValues.Item("TerbilangDaftarUlang") = Session("TerbilangDaftarUlang")
        e.NewValues.Item("RetriDaftarUlang") = Session("RetriDaftarUlang")
        PopupSimpanASPx.ShowOnPageLoad = True
    End Sub

    Protected Sub DafUlangDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DafUlangDetailsView.ItemUpdating
        Dim bilang As New Baca
        Dim dv As DetailsView = DafUlangDetailsView
        Dim RetTxt As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetribusiEdit"), ASPxTextBox)
        Dim persen As Double = 0.5
        Dim RIGdaftarulang As Decimal = Decimal.Zero

        RIGdaftarulang = CDec(RetTxt.Text) * CDec(persen)
        RetTxt.Text = bilang.Terbilang(RIGdaftarulang.ToString)
        e.NewValues.Item("RetriDaftarUlang") = RIGdaftarulang.ToString
        e.NewValues.Item("TerbilangDaftarUlang") = RetTxt.Text

        'Dim angkabelakang As Double = CDbl(Right(RIGdaftarulang.ToString, 2))
        'If angkabelakang < 50 Then
        '    RIGdaftarulang = RIGdaftarulang - angkabelakang
        'Else
        '    If angkabelakang > 50 And angkabelakang < 100 Then
        '        Dim penambahan As Double = 100 - angkabelakang
        '        RIGdaftarulang = RIGdaftarulang + angkabelakang
        '    End If
        'End If
    End Sub

#End Region

#End Region

#Region " Button Cetak "

    Protected Sub CetakButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim nopermohonan As String = NoPermohonanASPxTextBox.Text
        Dim cetak As New SKRDDaftarUlangHO.Parameters(nopermohonan)
        cetak.OpenReportInNewWindow()
    End Sub

    Protected Sub CetakSKRD_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim nopermohonan As String = NoPermohonanASPxTextBox.Text
        Dim skrd As New SKRDHO.Parameters(nopermohonan)
        skrd.OpenReportInNewWindow()
    End Sub

#End Region

End Class
