Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Partial Class Utility_Izin_LokasiForm
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        PemohonXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        StatusXpoDataSource.Session = session1
        LokasiXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("LokasiID") = Nothing
        End If
    End Sub

#Region " Cek Permohonan - PD - Cek Lokasi "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanButton.Click
        If NoPermohonanTextBox.Text.Trim IsNot Nothing Then
            If CekPermohonan(NoPermohonanTextBox.Text.Trim) = True Then
                LokasiDetailsView.Visible = True
                LokasiDetailsView.ChangeMode(DetailsViewMode.Edit)
            Else
                LokasiDetailsView.Visible = False
            End If
        End If
    End Sub

    Private Function CekPermohonan(ByVal noPermohonan As String) As Boolean
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
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
        Dim queryCrit As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='Lokasi'")
        Dim izinid As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), queryCrit), JenisIzin)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "' And JenisIzinID='" & izinid.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If objPD IsNot Nothing Then
            If CekLokasi(objPD.PermohonanIzinID.ToString) = True Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekLokasi(ByVal LokasiID As String) As Boolean
        Dim query3 As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & LokasiID & "'")
        Dim objLokasi As Lokasi = DirectCast(session1.FindObject(GetType(Lokasi), query3), Lokasi)
        If objLokasi IsNot Nothing Then
            Session("LokasiID") = objLokasi.LokasiID
            Session("objLokasi") = objLokasi
            Return True
        Else
            Session("LokasiID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region " Detail View "

    Protected Sub LokasiDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles LokasiDetailsView.ItemUpdating
        Dim dv As DetailsView = LokasiDetailsView
        Dim kecamatanID As CriteriaOperator
        Dim kelurahanId As CriteriaOperator
        Dim statusID As CriteriaOperator
        Dim pemilikkecId As CriteriaOperator
        Dim pemilikkelId As CriteriaOperator

        If Session("KecamatanLokasiID") IsNot Nothing Then
            kecamatanID = CriteriaOperator.Parse("KecamatanID='" & Session("KecamatanLokasiID").ToString & "'")
            pemilikkecId = CriteriaOperator.Parse("KecamatanID='" & Session("KecamatanLokasiID").ToString & "'")
        Else
            Dim cb As ASPxComboBox = DirectCast(dv.FindControl("KecamatanLokasiComboBox"), ASPxComboBox)
            kecamatanID = CriteriaOperator.Parse("KecamatanID='" & cb.Value.ToString & "'")
            Dim pemilikkecCb As ASPxComboBox = DirectCast(dv.FindControl("PemilikKecamatanLokasiComboBox"), ASPxComboBox)
            pemilikkecId = CriteriaOperator.Parse("KecamatanID='" & pemilikkecCb.Value.ToString & "'")
        End If
        If Session("KelurahanLokasiID") IsNot Nothing Then
            kelurahanId = CriteriaOperator.Parse("KelurahanID='" & Session("KelurahanLokasiID").ToString & "'")
            pemilikkelId = CriteriaOperator.Parse("KelurahanID='" & Session("KelurahanLokasiID").ToString & "'")
        Else
            Dim cb As ASPxComboBox = DirectCast(dv.FindControl("KelurahanLokasiComboBox"), ASPxComboBox)
            kelurahanId = CriteriaOperator.Parse("KelurahanID='" & cb.Value.ToString & "'")
            Dim pemilikkelCb As ASPxComboBox = DirectCast(dv.FindControl("PemilikKelurahanLokasiComboBox"), ASPxComboBox)
            pemilikkelId = CriteriaOperator.Parse("KelurahanID='" & pemilikkelCb.Value.ToString & "'")
        End If
        If Session("StatusID") IsNot Nothing Then
            statusID = CriteriaOperator.Parse("StatusTanahID='" & Session("StatusID").ToString & "'")
        Else
            Dim cb As ASPxComboBox = DirectCast(dv.FindControl("StatusComboBox"), ASPxComboBox)
            statusID = CriteriaOperator.Parse("StatusTanahID='" & cb.Value.ToString & "'")
        End If
        e.NewValues("PemilikKelurahanID") = DirectCast(session1.FindObject(GetType(Kelurahan), pemilikkelId), Kelurahan)
        e.NewValues("PemilikKecamatanID") = DirectCast(session1.FindObject(GetType(Kecamatan), pemilikkecId), Kecamatan)
            e.NewValues("PerusahaanKelurahanID") = DirectCast(session1.FindObject(GetType(Kelurahan), kelurahanId), Kelurahan)
            e.NewValues("PerusahaanKecamatanID") = DirectCast(session1.FindObject(GetType(Kecamatan), kecamatanID), Kecamatan)
            e.NewValues("StatusTanahID") = DirectCast(session1.FindObject(GetType(tanah), statusID), tanah)
    End Sub

    Protected Sub LokasiDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles LokasiDetailsView.ItemUpdated
        LokasiDetailsView.ChangeMode(DetailsViewMode.ReadOnly)
        Session("LokasiID") = Nothing
        TersimpanPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub LokasiDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles LokasiDetailsView.DataBound
        Dim dv As DetailsView = LokasiDetailsView
        Dim obj As Lokasi = CType(Session("objLokasi"), Lokasi)
        If dv.CurrentMode = DetailsViewMode.Edit Then
            Dim kel As ASPxComboBox = DirectCast(dv.FindControl("KelurahanLokasiComboBox"), ASPxComboBox)
            Dim kec As ASPxComboBox = DirectCast(dv.FindControl("KecamatanLokasiComboBox"), ASPxComboBox)
            Dim cb As ASPxComboBox = DirectCast(dv.FindControl("StatusComboBox"), ASPxComboBox)
            Dim pemilikkel As ASPxComboBox = DirectCast(dv.FindControl("PemilikKelurahanLokasiComboBox"), ASPxComboBox)
            Dim pemilikkec As ASPxComboBox = DirectCast(dv.FindControl("PemilikKecamatanLokasiComboBox"), ASPxComboBox)
            If obj.PerusahaanKelurahanID IsNot Nothing Then
                kel.Value = obj.PerusahaanKelurahanID.KelurahanID
                Session("KelurahanLokasiID") = obj.PerusahaanKelurahanID.KelurahanID
                kel.Text = obj.PerusahaanKelurahanID.KelurahanNama
            End If
            If obj.PerusahaanKecamatanID IsNot Nothing Then
                kec.Value = obj.PerusahaanKecamatanID.KecamatanID
                Session("KecamatanLokasiID") = obj.PerusahaanKecamatanID.KecamatanID
                kec.Text = obj.PerusahaanKecamatanID.KecamatanNama
            End If
            If obj.StatusTanahID IsNot Nothing Then
                cb.Value = obj.StatusTanahID.StatusTanahID
                Session("StatusID") = obj.StatusTanahID.StatusTanahID
                cb.Text = obj.StatusTanahID.StatusTanah
            End If
            If obj.PemilikKelurahanID IsNot Nothing Then
                pemilikkel.Value = obj.PemilikKelurahanID.KelurahanID
                Session("KelurahanLokasiID") = obj.PerusahaanKelurahanID.KelurahanID
                pemilikkel.Text = obj.PemilikKelurahanID.KelurahanNama
            End If
            If obj.PemilikKecamatanID IsNot Nothing Then
                pemilikkec.Value = obj.PemilikKecamatanID.KecamatanID
                Session("KecamatanLokasiID") = obj.PerusahaanKecamatanID.KecamatanID
                pemilikkec.Text = obj.PemilikKecamatanID.KecamatanNama
            End If
        End If
    End Sub

#End Region

#Region " Lokasi Callback "
    Protected Sub KelurahanCallback_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("StatusTanahID") = e.Parameter
    End Sub

    Protected Sub StatusCallback_Callback(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
    End Sub

    Protected Sub StatusCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("StatusID") = e.Parameter
        Dim status As String = e.Parameter
        Dim statusID As Guid = New Guid(status)
        Dim objStat As tanah = DirectCast(session1.GetObjectByKey(GetType(tanah), statusID), tanah)
        Session("StatusTanah") = objStat.StatusTanah
    End Sub

    Protected Sub KelurahanLokasiCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("KelurahanLokasiID") = e.Parameter
        Dim s As String = e.Parameter
        Dim sID As Guid = New Guid(s)
        Dim objStat As Kelurahan = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), sID), Kelurahan)
        Session("KelurahanLokasiNama") = objStat.KelurahanNama
    End Sub

    Protected Sub KelurahanLokasiComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanLokasiID") = e.Parameter
        Dim s As String = e.Parameter
        Dim sID As Guid = New Guid(s)
        Dim objStat As Kecamatan = DirectCast(session1.GetObjectByKey(GetType(Kecamatan), sID), Kecamatan)
        Session("KecamatanLokasiNama") = objStat.KecamatanNama
        Dim dv As DetailsView = LokasiDetailsView
        Dim kel As ASPxComboBox = DirectCast(dv.FindControl("KelurahanLokasiComboBox"), ASPxComboBox)
        kel.DataBind()
    End Sub

#End Region

#Region " Lokasi Callback Pemilik "
    Protected Sub PemilikKelurahanCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("KelurahanLokasiID") = e.Parameter
        Dim s As String = e.Parameter
        Dim sID As Guid = New Guid(s)
        Dim objStat As Kelurahan = DirectCast(session1.GetObjectByKey(GetType(Kelurahan), sID), Kelurahan)
        Session("KelurahanLokasiNama") = objStat.KelurahanNama
    End Sub

    Protected Sub PemilikKelurahanLokasiComboBox_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("KecamatanLokasiID") = e.Parameter
        Dim s As String = e.Parameter
        Dim sID As Guid = New Guid(s)
        Dim objStat As Kecamatan = DirectCast(session1.GetObjectByKey(GetType(Kecamatan), sID), Kecamatan)
        Session("KecamatanLokasiNama") = objStat.KecamatanNama
        Dim dv As DetailsView = LokasiDetailsView
        Dim kel As ASPxComboBox = DirectCast(dv.FindControl("PemilikKelurahanLokasiComboBox"), ASPxComboBox)
        kel.DataBind()
    End Sub
#End Region
End Class
