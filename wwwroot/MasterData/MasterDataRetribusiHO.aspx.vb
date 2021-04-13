Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports System
Imports Bisnisobjek.OSS

Partial Class MasterData_MasterDataRetribusiHO
    Inherits System.Web.UI.Page
    Private session1 As New Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        RetribusiXpoDataSource.Session = session1
        IndeksLokasiXpoDataSource.Session = session1
        IndeksGangguanXpoDataSource.Session = session1
        UsahaIndustriXpoDataSource.Session = session1
        PerdaganganTokoXpoDataSource.Session = session1
        PergudanganPasarXpoDataSource.Session = session1
        SifatSosialXpoDataSource.Session = session1
    End Sub
    Protected Sub ASPxMenuPilih_ItemClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxMenu.MenuItemEventArgs) Handles ASPxMenuPilih.ItemClick
        If e.Item.Name = "TL" Then
            PanelTarifLingkungan.Visible = True
            ASPxPanelIndeksLokasi.Visible = False
            ASPxPaneIndeksGangguan.Visible = False
            'ASPxGridViewTarifLingkungan.DataBind()
        ElseIf e.Item.Name = "IndeksLokasi" Then
            ASPxPanelIndeksLokasi.Visible = True
            ASPxPaneIndeksGangguan.Visible = False
            PanelTarifLingkungan.Visible = False
            ASPxGridViewIndeksLokasi.DataBind()
        ElseIf e.Item.Name = "IndeksGangguan" Then
            ASPxPaneIndeksGangguan.Visible = True
            PanelTarifLingkungan.Visible = False
            ASPxPanelIndeksLokasi.Visible = False
            ASPxGridViewIndeksGangguan.DataBind()
        End If
    End Sub
End Class
