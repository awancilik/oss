Option Explicit On
Option Strict On

Imports DevExpress.Xpo

Partial Class MasterData_MasterDataKLUI
    Inherits System.Web.UI.Page

    Dim session1 As New Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        JenisIndustriXpoDataSource.Session = session1
        JenisIndustriListXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub JenisUsahaKLUIASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles JenisUsahaKLUIASPxGridView.RowInserting

    End Sub

End Class
