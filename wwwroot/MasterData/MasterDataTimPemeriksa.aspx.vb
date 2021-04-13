Option Explicit On
Option Strict On

Imports DevExpress.Xpo

Partial Class MasterData_MasterDataTimPemeriksa
    Inherits System.Web.UI.Page

    Dim session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        timPemeriksaXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

End Class
