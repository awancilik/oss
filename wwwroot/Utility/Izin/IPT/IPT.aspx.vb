Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxCallbackPanel
Imports DevExpress.Web.ASPxClasses


Partial Class Utility_Izin_IPT_IPT
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        PemohonXpoDataSource.Session = session1
        'KabupatenXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        'StatusXpoDataSource.Session = session1
        IPTXpoDataSource.Session = session1
        'KelurahanPemilikXpoDataSource.Session = session1
        'KecamatanPemilikXpoDataSource.Session = session1
        'KelurahanXpoDataSource.Session = session1
        'KecamatanIPTXpoDataSource.Session = session1
        'KelurahanPerusahaanXpoDataSource.Session = session1
        'KecamatanPerusahaanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("IPTID") = Nothing
            Session("PermohonanID") = Nothing
        End If
    End Sub

    Protected Sub KelurahanPemilikComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        Session("IPTKelurahanID") = cb.SelectedItem.Value
    End Sub

#Region "CekPermohonan,PD,IPT"
    Protected Sub NoPermohonanButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        Dim nopermohonan As String = NoPermohonanTextBox.Text
        If cekPermohonan(nopermohonan) = True Then
            IPTDetailsView.Visible = True
            IPTDetailsView.ChangeMode(DetailsViewMode.Edit)
        ElseIf NoPermohonanButton.Text Is Nothing Then
            PopupKosongTexBox.ShowOnPageLoad = True
        Else
            ASPxPopupControl1.ShowOnPageLoad = True
        End If
    End Sub
    Private Function cekPermohonan(ByVal nopermohonan As String) As Boolean
        Dim query As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & nopermohonan.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query), Permohonan)
        If objPermohonan IsNot Nothing Then
            If cekPD(objPermohonan.PermohonanID.ToString) = True Then
                Return True
            End If
        Else
            Return False
        End If
    End Function
    Private Function cekPD(ByVal permohonanid As String) As Boolean
        Dim criter As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='IPT'")
        Dim objJenisIzin As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), criter), JenisIzin)
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "'And JenisIzinID='" & objJenisIzin.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query1), PermohonanDetail)
        If objPD IsNot Nothing Then
            If cekIPT(objPD.PermohonanIzinID.ToString) Then
                Return True
            Else
                Return False
            End If
        End If
    End Function
    Private Function cekIPT(ByVal IPTID As String) As Boolean
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("IPTID='" & IPTID & "'")
        Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), query2), IPT)
        If objIPT IsNot Nothing Then
            Session("IPTID") = objIPT.IPTID.ToString
            Return True
        Else
            Session("IPTID") = Nothing
        End If
    End Function
#End Region

#Region "CallBack"
    Protected Sub KelurahanASPxCallback_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles KelurahanASPxCallback.Callback
        Session("KelurahanID") = e.Parameter
    End Sub
    Protected Sub KelurahanASPxCallback_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanID") = e.Parameter
        Dim dv As DetailsView = IPTDetailsView
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

#Region "DetailView"
    Protected Sub IPTDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles IPTDetailsView.DataBound
        If IPTDetailsView.CurrentMode = DetailsViewMode.Edit Then
            IPTedittemplate()
        End If
    End Sub

    Protected Sub IPTDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles IPTDetailsView.ItemUpdated
        IPTDetailsView.Visible = False
        TersimpanPopupControl.ShowOnPageLoad = True
    End Sub

    Private Sub IPTedittemplate()
        Dim deview As DetailsView = IPTDetailsView
        Dim kelurahancombo As ASPxComboBox = DirectCast(deview.FindControl("KelurahanPemilikComboBox"), ASPxComboBox)
        Dim kecamatancombo As ASPxComboBox = DirectCast(deview.FindControl("pemilikKecamatanASPxComboBox"), ASPxComboBox)
        If kelurahancombo IsNot Nothing And kecamatancombo IsNot Nothing Then
            Dim query As CriteriaOperator = CriteriaOperator.Parse("IPTID='" & Session("IPTID").ToString & "'")
            Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), query), IPT)
            If CStr(Session("KecamatanID")) IsNot Nothing Then
                kecamatancombo.Value = CStr(Session("KecamatanID"))
                kecamatancombo.Text = CStr(Session("KecamatanNama"))
                kecamatancombo.DataBind()
            Else
                If objIPT.PemilikKelurahanID IsNot Nothing Then
                    kelurahancombo.Value = objIPT.PemilikKelurahanID.ToString
                    kelurahancombo.Text = objIPT.PemilikKelurahanID.KelurahanNama
                End If
                If CStr(Session("KelurahanID")) IsNot Nothing Then
                    kelurahancombo.Value = CStr(Session("KelurahanID"))
                    kelurahancombo.Text = CStr(Session("KelurahanNama"))
                    kelurahancombo.DataBind()
                Else
                    If objIPT.PemilikKecamatanID IsNot Nothing Then
                        kecamatancombo.Value = objIPT.PemilikKecamatanID.ToString
                        kecamatancombo.Text = objIPT.PemilikKecamatanID.KecamatanNama
                    End If
                    'If objIPT IsNot Nothing Then
                    '    If objIPT.PemilikKelurahanID IsNot Nothing Then
                    '        kelurahancombo.Value = objIPT.PemilikKelurahanID.ToString
                    '        kelurahancombo.Text = objIPT.PemilikKelurahanID.KelurahanNama
                    '        Session("KelurahanID") = kelurahancombo.Text
                    '        kelurahancombo.DataBind()
                    '    End If
                    '    If objIPT.PemilikKecamatanID IsNot Nothing Then
                    '        kecamatancombo.Value = objIPT.PemilikKecamatanID.ToString
                    '        kecamatancombo.Text = objIPT.PemilikKecamatanID.KecamatanNama
                    '        Session("KecamatanID") = kecamatancombo.Text
                    '        kecamatancombo.DataBind()
                    '    End If
                End If
            End If
        End If
    End Sub

    Protected Sub IPTDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles IPTDetailsView.ItemUpdating
        'Dim deview As DetailsView = IPTDetailsView
        Dim query As CriteriaOperator = CriteriaOperator.Parse("IPTID='" & Session("IPTID").ToString & "'")
        Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), query), IPT)
        Dim kecamatanid As String = CStr(Session("KecamatanID"))
        Dim kelurahanid As String = CStr(Session("KelurahanID"))
        If kecamatanid IsNot Nothing Then
            objIPT.PemilikKecamatanID = DirectCast(session1.GetObjectByKey(GetType(Kecamatan), New Guid(kecamatanid.ToString)), Kecamatan)
        End If
        If kelurahanid IsNot Nothing Then
            objIPT.PemilikKelurahanID = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), New Guid(kelurahanid.ToString)), Kelurahan)
        End If
        If CStr(Session("kelurahanID")) IsNot Nothing Then
            Dim kelurahan As CriteriaOperator = CriteriaOperator.Parse("KelurahanID='" & Session("kelurahanID").ToString & "'")
            objIPT.PemilikKelurahanID = DirectCast(session1.FindObject(GetType(Kelurahan), kelurahan), Kelurahan)
        End If
        If CStr(Session("kecamatanID")) IsNot Nothing Then
            Dim kecamatan As CriteriaOperator = CriteriaOperator.Parse("KecamatanID='" & Session("kecamatanID").ToString & "'")
            objIPT.PemilikKecamatanID = DirectCast(session1.FindObject(GetType(Kecamatan), kecamatan), Kecamatan)
        End If
        objIPT.Save()
    End Sub
#End Region

End Class
