Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Xpo.DB
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxGridView
Imports Bisnisobjek
Partial Class Utility_Izin_HOMaintenance

#Region " Xpo "
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        XpoDataSourceGangguan.Session = session1
        XpoDataSourceUsaha.Session = session1
        XpoDataSourceGanggu.Session = session1
        XpoDataSourceJenis.Session = session1
        XpoDataSourceEnergi.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PanelGangguan.Visible = False
        PanelJenisUsaha.Visible = False
        PanelEnergi.Visible = False
    End Sub

#End Region

#Region " Menu "

    Protected Sub PilihHOMaintenance_ItemClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxMenu.MenuItemEventArgs) Handles PilihHOMaintenance.ItemClick
        Select Case e.Item.Name
            'Case "Gangguan"
            '    PanelGangguan.Visible = True
            '    ASPGridView.DataBind()
            Case "JenisUsaha"
                PanelJenisUsaha.Visible = True
                GridViewJenisUsaha.DataBind()
                'Case "Energi"
                '    PanelEnergi.Visible = True
                '    GridSumber.DataBind()
                'Case Else
        End Select
    End Sub

#End Region

End Class
