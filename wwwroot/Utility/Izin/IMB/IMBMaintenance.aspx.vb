Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS


Partial Class Utility_Izin_IMBMaintenance
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        JenisBangunanXpoDataSource.Session = session1
        TujuanPengajuanXpoDataSource.Session = session1
        PelaksanaXpoDataSource.Session = session1
        StatusTanahXpoDataSource.Session = session1
        JenisBahanXpoDataSource.Session = session1
        KoefXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

End Class