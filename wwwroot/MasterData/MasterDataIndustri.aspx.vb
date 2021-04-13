Option Explicit On
Option Strict On

Imports System
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Partial Class MasterData_MasterDataIndustri
    Inherits System.Web.UI.Page
    Dim session1 As New Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        StatusPabrikXpoDatasource.Session = session1
        StatusBangunanXpoDataSource.Session = session1
        JenisIndustriXpoDataSource.Session = session1
        JenisIndustriListXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PabrikASPxPanel.Visible = False
        BangunanASPxPanel.Visible = False
        'JenisUsahaKLUIASPxPanel.Visible = False
    End Sub
    Protected Sub ASPxMenu1_ItemClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxMenu.MenuItemEventArgs) Handles ASPxMenu1.ItemClick
        If e.Item.Name = "StatusPabrik" Then
            PabrikASPxPanel.Visible = True
            StatusPabrikASPxGridView.DataBind()
        ElseIf e.Item.Name = "StatusBangunan" Then
            BangunanASPxPanel.Visible = True
            StatusBangunanASPxGridView.DataBind()
            'Else
            '    JenisUsahaKLUIASPxPanel.Visible = True
            '    JenisUsahaKLUIASPxGridView.DataBind()
        End If
    End Sub
End Class
