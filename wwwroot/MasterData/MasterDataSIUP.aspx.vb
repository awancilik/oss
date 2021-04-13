Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Data.Filtering
Partial Class MasterData_MasterDataSIUP
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        ModalXpoDataSource.Session = session1
        LembagaSIUPXpoDataSource.Session = session1
        JenisPermohonanXpoDataSource.Session = session1
        SyaratXpoDataSource.Session = session1
        SIUPJenisXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    
    Protected Sub SIUPJenisASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles SIUPJenisASPxGridView.RowInserting
        Dim nSyaratIzin As New SyaratIzin(session1)
        With nSyaratIzin
            .SyaratIzinID = Guid.NewGuid
            .JenisPermohonanIzinID = session1.FindObject(Of JenisPermohonanIzin)(New BinaryOperator("JenisPermohonanIzinID", e.NewValues("JenisPermohonan!Key")))
            .MasterDataSyaratID = session1.FindObject(Of MasterDataSyarat)(New BinaryOperator("MasterDataSyaratID", e.NewValues("SyaratID!Key")))
            .JenisIzinID = session1.FindObject(Of JenisIzin)(New BinaryOperator("JenisIzinID", .JenisPermohonanIzinID.JenisIzinID.JenisIzinID))
            .Save()
        End With
    End Sub
End Class