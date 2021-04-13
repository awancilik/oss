Option Explicit On
Option Strict On

Imports System
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Imports DevExpress.Web
Imports DevExpress.Web.ASPxEditors
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_HO_HODaftarUlang
    Inherits System.Web.UI.Page
    Private session1 As New Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        AddHandler DaftUlangHO.ItemInserting, AddressOf DaftUlangHO_ItemInserting
        HOXpoDataSource.Session = session1
        JenisUsahaDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub CallbackJenis_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs) Handles CallbackJenis.Callback
        Session("JenisUsaha") = e.Parameter
    End Sub

    Protected Sub CallbackJenis_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
        Session("JenisUsaha") = e.Parameter
        Dim dv As DetailsView = DaftUlangHO
        Dim jenisusahacombo As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
        If jenisusahacombo IsNot Nothing Then
            jenisusahacombo.DataBind()
        End If
    End Sub

    Protected Sub DaftUlangHO_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) 'Handles DaftUlangHO.ItemInserting
        'Dim dv As DetailsView = DaftUlangHO
        'Dim cbJenisUsaha As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
        Dim objho As New HO(session1)
        Dim jenisusahaid As String = CStr(Session("JenisUsaha"))
        If jenisusahaid IsNot Nothing Then
            objho.JenisUsahaID = DirectCast(session1.GetObjectByKey(GetType(HOJenisUsaha), New Guid(jenisusahaid.ToString)), HOJenisUsaha)
        End If
        If CStr(Session("jenisUsahaID")) IsNot Nothing Then
            Dim usaha As CriteriaOperator = CriteriaOperator.Parse("JenisUsahaID='" & Session("jenisUsahaID").ToString & "'")
            objho.JenisUsahaID = DirectCast(session1.GetObjectByKey(GetType(HOJenisUsaha), usaha), HOJenisUsaha)
        End If
        objho.Save()
    End Sub
End Class
