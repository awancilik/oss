Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_LokasiMaintenance
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        LokasiTujuanXpoDataSource.Session = session1
        HDPPTXpoDataSource.Session = session1
        IPXpoDataSource.Session = session1
        IUXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub ASPxMenu4_ItemClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxMenu.MenuItemEventArgs) Handles ASPxMenu4.ItemClick
        TujuanPanel.Visible = False
        HDPPTPanel.Visible = False
        IPPanel.Visible = False
        IUPanel.Visible = False
        If e.Item.Name = "Tujuan" Then
            TujuanPanel.Visible = True
            TujuanGridView.DataBind()
        ElseIf e.Item.Name = "HDPPT" Then
            HDPPTPanel.Visible = True
            HDPPTGridView.DataBind()
        ElseIf e.Item.Name = "IP Tanah" Then
            IPPanel.Visible = True
            IPGridView.DataBind()
        ElseIf e.Item.Name = "Indek Usaha" Then
            IUPanel.Visible = True
            IUGridView.DataBind()
        End If
    End Sub

End Class
