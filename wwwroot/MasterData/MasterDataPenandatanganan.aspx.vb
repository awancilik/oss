Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering

Partial Class MasterData_MasterDataPenandatanganan
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        PenandatangananXpoDataSource.Session = session1
        JenisIzinXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    'Protected Sub CariTanggal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariTanggal.Click
    '    Dim awal As String = TglAwalDateEdit.Date.ToString
    '    Dim ahkir As String = TglAhkirDateEdit.Date.ToString
    '    Dim query As CriteriaOperator = CriteriaOperator.Parse("")
    'End Sub
End Class
