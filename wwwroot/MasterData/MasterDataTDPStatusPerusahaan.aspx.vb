Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports System
Partial Class MasterData_MasterDataTDPStatusPerusahaan
    Inherits System.Web.UI.Page
    Private session1 As New Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        StatusPerusahaanXpoDataSource.Session = session1
    End Sub
End Class
