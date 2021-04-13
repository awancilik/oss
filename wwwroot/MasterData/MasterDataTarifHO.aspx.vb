Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports System
Imports Bisnisobjek.OSS
Partial Class MasterData_MasterDataTarifHO
    Inherits System.Web.UI.Page
    Private session1 As New Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        XpoDataSourceJenisLingkunganHO.Session = session1
        XpoDataSourceTarifHO.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub GridViewTaripLingkunganHO_DetailRowExpandedChanged(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewDetailRowEventArgs) Handles GridViewTaripLingkunganHO.DetailRowExpandedChanged
        Session("HOTaripLingkunganID") = TryCast(sender, DevExpress.Web.ASPxGridView.ASPxGridView).GetRowValues(e.VisibleIndex, "HOTaripLingkunganID")
        Dim s As String = Session("HOTaripLingkunganID").ToString

    End Sub

    Protected Sub GridViewJenisLingkungan_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("HOTaripJenisID!Key") = Session("HOTaripLingkunganID")
        Dim s As String = Session("HOTaripLingkunganID").ToString
    End Sub
End Class
