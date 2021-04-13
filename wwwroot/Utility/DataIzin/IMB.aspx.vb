Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo

Partial Class Utility_DataIzin_IMB
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IMBXpoDataSource.Session = session1
        PermohonanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KabupatenXpoDataSource.Session = session1
        PropinsiXpoDataSource.Session = session1
        TujuanXpoDataSource.Session = session1
        PelaksanaXpoDataSource.Session = session1
        StatusTanahXpoDataSource.Session = session1
        JenisXpoDataSource.Session = session1
        PerusahaanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
End Class
