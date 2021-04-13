Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors
Partial Class Utility_Izin_IUI
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IUIXpoDataSource.Session = session1
        IUIMesinXpoDataSource.Session = session1
        StatusBangunanXpoDataSource.Session = session1
        StatusPabrikXpoDataSource.Session = session1
        IUIDetailXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        IUIMesinXpoDataSource.Session = session1
        KomoditiXpoDataSource.Session = session1
        KLUIXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Permohonan - PD - Cek IUI "

    Protected Sub NomorPermohonanASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NomorPermohonanASPxButton.Click
        Dim nomorpermohonan As String = NomorPermohonanASPxTextBox.Text
        If CekPermohonan(nomorpermohonan) = True Then
            IUIDetailsView.Visible = True
            IUIDetailsView.ChangeMode(DetailsViewMode.Edit)
        Else
            PeringatanASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub

    Private Function CekPermohonan(ByVal noPermohonan As String) As Boolean
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        If objPermohonan IsNot Nothing Then
            If CekPD(objPermohonan.PermohonanID.ToString) = True Then
                Return True
            End If
        Else
            Return False
        End If
    End Function

    Private Function CekPD(ByVal permohonanid As String) As Boolean
        Dim izin As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='IUI'")
        Dim JenisIzinId As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), izin), JenisIzin)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "' And JenisIzinID='" & JenisIzinId.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If objPD IsNot Nothing Then
            If CekIUI(objPD.PermohonanIzinID.ToString) = True Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekIUI(ByVal IUIID As String) As Boolean
        Dim query3 As CriteriaOperator = CriteriaOperator.Parse("IUIID='" & IUIID & "'")
        Dim objIUI As IUI = DirectCast(session1.FindObject(GetType(IUI), query3), IUI)
        If objIUI IsNot Nothing Then
            Session("IUIID") = objIUI.IUIID.ToString
            Return True
        Else
            Session("IUIID") = Nothing
            Return False
        End If
    End Function
#End Region

#Region " DetailView "

    Protected Sub IUIDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles IUIDetailsView.DataBound
        If IUIDetailsView.CurrentMode = DetailsViewMode.Edit Then
            IUIedittemplate()
        End If
        If IUIDetailsView.CurrentMode = DetailsViewMode.ReadOnly Then

        End If

    End Sub

    Protected Sub IUIDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles IUIDetailsView.ItemUpdated
        IUIDetailsView.Visible = False
        TersimpanPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub IUIDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles IUIDetailsView.ItemUpdating
        Dim dv As DetailsView = IUIDetailsView
        Dim investasiTB As ASPxTextBox = DirectCast(dv.FindControl("InvestasiASPxTextBox"), ASPxTextBox)
        Dim investasi As String = investasiTB.Text
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("IUIID='" & Session("IUIID").ToString & "'")
        Dim objIUI As IUI = DirectCast(session1.FindObject(GetType(IUI), query1), IUI)
        Dim fTerbilang As New Baca
        If CInt(investasiTB.Text) > 0 Then
            objIUI.InvestasiTerbilang = fTerbilang.Terbilang(investasi)
        End If
        If CStr(Session("pabrikKelID")) IsNot Nothing Then
            Dim kelurahanpabrik As CriteriaOperator = CriteriaOperator.Parse("KelurahanID='" & Session("pabrikKelID").ToString & "'")
            objIUI.PabrikKelurahanID = DirectCast(session1.FindObject(GetType(Kelurahan), kelurahanpabrik), Kelurahan)
        End If
        If CStr(Session("StatusBangunanID")) IsNot Nothing Then
            Dim statusbangunan As CriteriaOperator = CriteriaOperator.Parse("StatusBangunanID='" & Session("StatusBangunanID").ToString & "'")
            objIUI.StatusBangunan = DirectCast(session1.FindObject(GetType(StatusBangunan), statusbangunan), StatusBangunan)
        End If
        If CStr(Session("tglDikeluarkan")) IsNot Nothing Then
            objIUI.TglDikeluarkan = CDate(Session("tglDikeluarkan"))
        End If
        If CStr(Session("tglBerahkir")) IsNot Nothing Then
            objIUI.TglBerahkir = CDate(Session("tglBerahkir"))
        End If
        objIUI.Save()


    End Sub

    Private Sub IUIedittemplate()
        Dim dv As DetailsView = IUIDetailsView
        Dim statBangunanComboBox As ASPxComboBox = DirectCast(dv.FindControl("StatusBangunanASPxComboBox"), ASPxComboBox)
        Dim pabKelComboBox As ASPxComboBox = DirectCast(dv.FindControl("pabrikKelASPxComboBox"), ASPxComboBox)
        Dim pabKecComboBox As ASPxComboBox = DirectCast(dv.FindControl("pabrikKecASPxComboBox"), ASPxComboBox)
        Dim tglDikeluarkan As ASPxDateEdit = DirectCast(dv.FindControl("TglDikeluarkanASPxDateEdit"), ASPxDateEdit)
        Dim tglberahkir As ASPxDateEdit = DirectCast(dv.FindControl("TglBerahkirASPxDateEdit"), ASPxDateEdit)
        If statBangunanComboBox IsNot Nothing And pabKelComboBox IsNot Nothing And tglDikeluarkan IsNot Nothing And tglberahkir IsNot Nothing Then
            Dim query1 As CriteriaOperator = CriteriaOperator.Parse("IUIID='" & Session("IUIID").ToString & "'")
            Dim objIUI As IUI = DirectCast(session1.FindObject(GetType(IUI), query1), IUI)
            If objIUI IsNot Nothing Then
                If objIUI.StatusBangunan IsNot Nothing Then
                    statBangunanComboBox.Value = objIUI.StatusBangunan.StatusBangunanID.ToString
                    statBangunanComboBox.Text = objIUI.StatusBangunan.StatusBangunan
                    Session("StatusBangunanID") = objIUI.StatusBangunan.StatusBangunanID.ToString
                End If
                If objIUI.PabrikKelurahanID IsNot Nothing Then
                    pabKelComboBox.Value = objIUI.PabrikKelurahanID.KelurahanID.ToString
                    pabKelComboBox.Text = objIUI.PabrikKelurahanID.KelurahanNama
                    Session("pabrikKelID") = objIUI.PabrikKelurahanID.KelurahanID.ToString
                    If pabKecComboBox IsNot Nothing Then
                        pabKecComboBox.Value = objIUI.PabrikKelurahanID.KelurahanKecamatanID.KecamatanID.ToString
                        pabKecComboBox.Text = objIUI.PabrikKelurahanID.KelurahanKecamatanID.KecamatanNama
                    End If
                End If
                Dim klui As CriteriaOperator = CriteriaOperator.Parse("IUIID='" & Session("IUIID").ToString & "'")
                Dim objIUIDetail As IUIDetail = DirectCast(session1.FindObject(GetType(IUIDetail), klui), IUIDetail)
                If CStr(objIUI.TglDikeluarkan) IsNot Nothing Then
                    tglDikeluarkan.Date = objIUI.TglDikeluarkan
                    Session("tglDikeluarkan") = objIUI.TglDikeluarkan
                End If
                If CStr(objIUI.TglBerahkir) IsNot Nothing Then
                    tglberahkir.Date = objIUI.TglBerahkir
                    Session("tglBerahkir") = objIUI.TglBerahkir
                End If
            End If
        End If
    End Sub

#End Region

#Region " Callback "

    Protected Sub StatusBangunanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles StatusBangunanASPxCallback.Callback
        Session("StatusBangunanID") = e.Parameter
    End Sub

    Protected Sub pabrikKelASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles pabrikKelASPxCallback.Callback
        Session("pabrikKelID") = e.Parameter
    End Sub

    Protected Sub JenisUsahaKLUIASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles JenisUsahaKLUIASPxCallback.Callback
        Session("JenisKLUI") = e.Parameter
    End Sub

    'Protected Sub tglDikeluarkanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles tglDikeluarkanASPxCallback.Callback
    '    Session("tglDikeluarkan") = e.Parameter
    'End Sub

    'Protected Sub tglBerahkirASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles tglBerahkirASPxCallback.Callback
    '    Session("tglBerahkir") = e.Parameter
    'End Sub

    Protected Sub pabrikKelASPxCallback_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanID") = e.Parameter
        Dim dv As DetailsView = IUIDetailsView
        Dim kelurahanCombobox As ASPxComboBox = DirectCast(dv.FindControl("pabrikKelASPxComboBox"), ASPxComboBox)
        If kelurahanCombobox IsNot Nothing Then
            kelurahanCombobox.DataBind()
        End If
    End Sub
#End Region

#Region " GridView "
    Protected Sub KLUIASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IUIID!Key") = Session("IUIID").ToString
    End Sub
    'Protected Sub KLUIASPxGridView_RowInserted(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertedEventArgs)
    '    Dim query1 As CriteriaOperator = CriteriaOperator.Parse("IUIDetailID='" & Session("iuiDetailID").ToString & "'")
    '    Dim query2 As CriteriaOperator = CriteriaOperator.Parse("IUIID='" & Session("IUIID").ToString & "'")
    '    Dim objiuidetail As IUIDetail = DirectCast(session1.FindObject(GetType(IUIDetail), query1), IUIDetail)
    '    If objiuidetail IsNot Nothing Then
    '        objiuidetail.IUIID = DirectCast(session1.FindObject(GetType(IUI), query1), IUI)
    '        objiuidetail.Save()
    '    End If
    'End Sub
    Protected Sub KomoditiASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("IUIID='" & Session("IUIID").ToString & "'")
        Dim objIUI As IUI = DirectCast(session1.FindObject(GetType(IUI), query1), IUI)
        e.NewValues.Item("IUIKomoditiID") = Guid.NewGuid
        e.NewValues.Item("IUIID!Key") = objIUI.IUIID
    End Sub
#End Region


End Class
