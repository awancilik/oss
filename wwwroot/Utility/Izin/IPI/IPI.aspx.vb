Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Partial Class Utility_Izin_IPI_IPI
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("IPIID") = Nothing
            Session("PermohonanID") = Nothing
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IPIXpoDataSource.Session = session1
        InvestasiXpoDataSource.Session = session1
        JenisModalXpoDataSource.Session = session1
        IPIMesinProduksiXpoDataSource.Session = session1
        IPIMesinPencemaranXpoDataSource.Session = session1
        IPIKomoditiXpoDataSource.Session = session1
        IPIDetailXpoDataSource.Session = session1
        KLUIXpoDataSource.Session = session1
        PemasaranXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Permohonan - PD - Cek IPI "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim noPermohonan As String = NomorPermohonanASPxTextBox.Text.Trim
        If noPermohonan IsNot Nothing Then
            If CekPermohonan(noPermohonan) = True Then
                IPIDetailsView.Visible = True
                IPIDetailsView.ChangeMode(DetailsViewMode.Edit)
            Else
                PeringatanASPxPopupControl.ShowOnPageLoad = True
            End If
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
        Dim queryCrit As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='IPI'")
        Dim izinid As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), queryCrit), JenisIzin)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "' And JenisIzinID='" & izinid.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If objPD IsNot Nothing Then
            If CekIUI(objPD.PermohonanIzinID.ToString) = True Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekIUI(ByVal IPIID As String) As Boolean
        Dim query3 As CriteriaOperator = CriteriaOperator.Parse("IPIID='" & IPIID & "'")
        Dim objIPI As IPI = DirectCast(session1.FindObject(GetType(IPI), query3), IPI)
        If objIPI IsNot Nothing Then
            Session("IPIID") = objIPI.IPIID.ToString
            Return True
        Else
            Session("IPIID") = Nothing
            Return False
        End If
    End Function
#End Region

#Region " Grid View "

    Protected Sub MesinASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPIID!Key") = Session("IPIID")
        e.NewValues.Item("ProduksiPencemaran") = "Produksi"
    End Sub
    Protected Sub MesinPencemaranASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPIID!Key") = Session("IPIID")
        e.NewValues.Item("ProduksiPencemaran") = "Pencemaran"
    End Sub
    Protected Sub KLUIASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPIID!Key") = Session("IPIID")
    End Sub
    Protected Sub InvestasiASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPIID!Key") = Session("IPIID")
    End Sub
    Protected Sub PemasaranGridview_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPIID!Key") = Session("IPIID")
    End Sub
    Protected Sub KomoditasASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("IPIID!Key") = Session("IPIID")
    End Sub
#End Region

#Region " Detail View "

    Protected Sub IPIDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles IPIDetailsView.DataBound
        If CStr(Session("IPIID")) IsNot Nothing Then
            Dim ipiid As CriteriaOperator = CriteriaOperator.Parse("IPIID='" & Session("IPIID").ToString & "'")
            Dim objIPI As IPI = DirectCast(session1.FindObject(GetType(IPI), ipiid), IPI)
            If objIPI IsNot Nothing Then
                If objIPI.PabrikKelurahanID IsNot Nothing Then
                    Kombo_box(objIPI)
                End If
            End If
            Dim dv As DetailsView = IPIDetailsView
            Dim Investasi As ASPxTextBox = DirectCast(dv.FindControl("InvestasiASPxTextbox"), ASPxTextBox)
            If Investasi IsNot Nothing Then
                Investasi.Text = CInt(objIPI.Investasi).ToString
            End If
        End If
    End Sub

    Private Function Kombo_box(ByVal objIPI As IPI) As Boolean
        Dim dv As DetailsView = IPIDetailsView
        Dim kelurahanCombobox As ASPxComboBox = DirectCast(dv.FindControl("KelurahanASPxComboBox"), ASPxComboBox)
        Dim kecamatanCombobox As ASPxComboBox = DirectCast(dv.FindControl("KecamatanPabrikASPxComboBox"), ASPxComboBox)
        If kelurahanCombobox IsNot Nothing And kecamatanCombobox IsNot Nothing Then
            kelurahanCombobox.Value = objIPI.PabrikKelurahanID.KelurahanID.ToString
            kelurahanCombobox.Text = objIPI.PabrikKelurahanID.KelurahanNama
            Session("KelurahanID") = objIPI.PabrikKelurahanID.KelurahanID.ToString
            Dim KecamatanID As CriteriaOperator = CriteriaOperator.Parse("KecamatanID='" & objIPI.PabrikKelurahanID.KelurahanKecamatanID.KecamatanID.ToString & "'")
            Dim okecamatan As Kecamatan = DirectCast(session1.FindObject(GetType(Kecamatan), KecamatanID), Kecamatan)
            If okecamatan IsNot Nothing Then
                kecamatanCombobox.Value = okecamatan.KecamatanID.ToString
                kecamatanCombobox.Text = okecamatan.KecamatanNama
            End If
        End If
    End Function

    Protected Sub IPIDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles IPIDetailsView.ItemUpdated
        TersimpanPopupControl.ShowOnPageLoad = True
        IPIDetailsView.Visible = False
    End Sub

    Protected Sub IPIDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles IPIDetailsView.ItemUpdating
        Dim ipiid As CriteriaOperator = CriteriaOperator.Parse("IPIID='" & Session("IPIID").ToString & "'")
        Dim objIPI As IPI = DirectCast(session1.FindObject(GetType(IPI), ipiid), IPI)
        Dim fTerbilang As New Baca
        Dim tbTerbilang As ASPxTextBox = DirectCast(IPIDetailsView.FindControl("InvestasiASPxTextbox"), ASPxTextBox)
        If objIPI IsNot Nothing Then
            objIPI.TglIzinLama = CDate(Session("TglIzinLama"))
            objIPI.PabrikKelurahanID = DirectCast(session1.FindObject(GetType(Kelurahan), CriteriaOperator.Parse("KelurahanID='" & Session("KelurahanID").ToString & "'")), Kelurahan)
            If tbTerbilang.Text IsNot "" Then
                If CInt(tbTerbilang.Text) > 0 Then
                    objIPI.InvestasiTerbilang = (fTerbilang.Terbilang(tbTerbilang.Text))
                End If
            Else
                objIPI.InvestasiTerbilang = ""
            End If
            objIPI.Save()
        End If
    End Sub
#End Region

#Region " Callback "

    Protected Sub KelurahanASPxCallback_Callback1(ByVal source As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanID") = e.Parameter
        Dim dv As DetailsView = IPIDetailsView
        Dim kelurahanCombobox As ASPxComboBox = DirectCast(dv.FindControl("KelurahanASPxComboBox"), ASPxComboBox)
        If kelurahanCombobox IsNot Nothing Then
            kelurahanCombobox.DataBind()
        End If
    End Sub

    Protected Sub KelurahanASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles KelurahanASPxCallback.Callback
        Session("KelurahanID") = e.Parameter
    End Sub

    Protected Sub TglIzinLamaASPxCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles TglIzinLamaASPxCallback.Callback
        Session("TglIzinLama") = e.Parameter
    End Sub
#End Region

End Class
