Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_LokasiRapat
    Inherits System.Web.UI.Page

    Dim session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        LokasiRapatXpoDataSource.Session = session1
        permohonanXpoDataSource.Session = session1
        LokasiRapatXpoDataSource.Session = session1
        LokasiRapatDetailXpoDataSource.Session = session1
        timPemeriksaXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            CheckLokasi(objPermohonan)
            If CheckRapat() = True Then
                permohonanDetailsView.DataBind()
            Else
                LokasiRapatDetailsView.ChangeMode(DetailsViewMode.Insert)
            End If
        Else
            Session("PermohonanID") = Nothing
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Private Sub CheckLokasi(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objLokasi As Lokasi = DirectCast(session1.FindObject(GetType(Lokasi), criteria), Lokasi)
        If objLokasi IsNot Nothing Then
            Session("LokasiID") = objLokasi.LokasiID
        Else
            Session("LokasiID") = Nothing
        End If
    End Sub

    Private Function CheckRapat() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objRapat As LokasiRapat = DirectCast(session1.FindObject(GetType(LokasiRapat), criteria), LokasiRapat)
        If objRapat IsNot Nothing Then
            Session("LokasiRapatID") = objRapat.LokasiRapatID
            LokasiRapatDetailsView.ChangeMode(DetailsViewMode.ReadOnly)
            Return True
        Else
            Session("LokasiRapatID") = Nothing
            Return False
        End If
    End Function

    Protected Sub lokasiRapatDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles LokasiRapatDetailsView.ItemInserting
        e.Values.Item("PermohonanID!Key") = Session("PermohonanID")
        e.Values.Item("LokasiID!Key") = Session("LokasiID")
        e.Values.Item("LokasiRapatTanggal") = Session("TanggalRapat")
    End Sub

    Protected Sub lokasiRapatDetailASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("LokasiRapatID!Key") = Session("LokasiRapatID")
        'Dim query As CriteriaOperator = CriteriaOperator.Parse("LokasiRapatID='" & Session("LokasiRapatID").ToString & "'")
        'Dim objLRDetail As LokasiRapatDetail = DirectCast(session1.FindObject(GetType(LokasiRapatDetail), query), LokasiRapatDetail)
        'If objLRDetail IsNot Nothing Then
        '    Dim rapat As String = e.NewValues.Item("")
        '    If objLRDetail.TimRapatID.ToString = objLRDetail.TimRapatID.ToString Then
        '        e.Cancel = True
        '    End If
        'End If
    End Sub

    Protected Sub TanggalCallback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("TanggalRapat") = CDate(e.Parameter)
    End Sub

    Protected Sub LokasiRapatDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles LokasiRapatDetailsView.ItemUpdating
        e.NewValues.Item("LokasiRapatTanggal") = Session("TanggalRapat")
    End Sub
End Class
