Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_SyaratIzin
    Inherits System.Web.UI.Page

    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        syaratIzinXpoDataSource.Session = session1
        jenisPermohonanIzinXpoDataSource.Session = session1
        jenisPermohonanIzinXpoDataSource2.Session = session1
        jenisIzinXpoDataSource.Session = session1
        masterDataSifatXpoDataSource.Session = session1
        masterDataSyaratXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    'Protected Sub jenisIzinASPxComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles jenisIzinASPxComboBox.SelectedIndexChanged
    '    Dim cb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
    '    If Not String.IsNullOrEmpty(cb.SelectedItem.Value.ToString) Then
    '        Session("JenisIzinID") = New Guid(cb.SelectedItem.Value.ToString)
    '    End If
    '    jenisPermohonanIzinASPxComboBox.DataBind()
    'End Sub

    Protected Sub insertASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles insertASPxButton.Click
        Dim obj As New SyaratIzin(session1)
        obj.JenisIzinID = TryCast(session1.GetObjectByKey(GetType(JenisIzin), New Guid(jenisIzinASPxComboBox.SelectedItem.Value.ToString)), JenisIzin)
        obj.JenisPermohonanIzinID = TryCast(session1.GetObjectByKey(GetType(JenisPermohonanIzin), New Guid(jenisPermohonanIzinASPxComboBox.SelectedItem.Value.ToString)), JenisPermohonanIzin)
        obj.MasterDataSyaratID = TryCast(session1.GetObjectByKey(GetType(MasterDataSyarat), New Guid(masterDataSyaratASPxComboBox.SelectedItem.Value.ToString)), MasterDataSyarat)
        obj.Save()
        syaratIzinASPxGridView.DataBind()
    End Sub

End Class
