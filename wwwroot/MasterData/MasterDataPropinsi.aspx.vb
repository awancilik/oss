Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Xpo.DB
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxGridView
Imports Bisnisobjek
Partial Class MasterData_MasterDataPropinsi
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        PropinsiXpoDataSource.Session = session1
        KabupatenXpoDataSource.Session = session1
        KecamatanXpoDataSource.Session = session1
        KelurahanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Propinsi GridView"

    Protected Sub propinsiGridView_DetailRowExpandedChanged(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewDetailRowEventArgs) Handles PropinsiGridView.DetailRowExpandedChanged
        Session("PropinsiID") = TryCast(sender, DevExpress.Web.ASPxGridView.ASPxGridView).GetRowValues(e.VisibleIndex, "PropinsiID")

    End Sub

#End Region

#Region " Kabupaten GridView"

    Protected Sub KabupatenGridView_DetailRowExpandedChanged(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewDetailRowEventArgs)
        Session("KabupatenID") = TryCast(sender, DevExpress.Web.ASPxGridView.ASPxGridView).GetRowValues(e.VisibleIndex, "KabupatenID")
    End Sub

    Protected Sub KabupatenGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("KabupatenPropinsiID!Key") = Session("PropinsiID")
        
    End Sub

#End Region

#Region " Kecamatan GridView"

    Protected Sub KecamatanGridView_DetailRowExpandedChanged(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewDetailRowEventArgs)
        Session("KecamatanID") = TryCast(sender, DevExpress.Web.ASPxGridView.ASPxGridView).GetRowValues(e.VisibleIndex, "KecamatanID")
        Dim s As String = Session("KecamatanID").ToString
    End Sub

    Protected Sub KecamatanGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("KecamatanKabupatenID!Key") = Session("KabupatenID")
    End Sub
#End Region

#Region " Kelurahan "
    Protected Sub KelurahanGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("KelurahanKecamatanID!Key") = Session("KecamatanID")
        Dim s As String = Session("KecamatanID").ToString
    End Sub
#End Region
End Class
