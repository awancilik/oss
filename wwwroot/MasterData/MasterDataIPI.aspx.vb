Option Explicit On
Option Strict On

Imports System
Imports DevExpress.Xpo
Partial Class MasterData_MasterDataIPI
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        JenisModalXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub MenuASPxMenu_ItemClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxMenu.MenuItemEventArgs) Handles MenuASPxMenu.ItemClick
        JenisModalASPxPanel.Visible = False
        If e.Item.Text = "Jenis Modal" Then
            JenisModalASPxPanel.Visible = True
        End If
    End Sub
End Class
