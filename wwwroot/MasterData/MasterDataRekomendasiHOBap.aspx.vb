Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Partial Class MasterData_MasterDataRekomendasiHOBap
    Inherits System.Web.UI.Page
    Private session1 As New Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        RekomendasiXpoDataSource.Session = session1
    End Sub
End Class
