Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Xpo.DB
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports Utility_ListPermohonan


Partial Class Utility_ListPermohonan
    Inherits System.Web.UI.Page

#Region " Xpo "
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        permohonanDetailXpoDataSource.Session = session1
        jenisIzinXpoDataSource.Session = session1
        jenisPermohonanIzinXpoDataSource.Session = session1
        izinJenisXpoDataSource.Session = session1
        PDXpoDataSource.Session = session1
        serachPermohonanXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#End Region

#Region " GridView "

    Protected Sub permohonanASPxGridView_DetailRowExpandedChanged(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewDetailRowEventArgs) Handles permohonanASPxGridView.DetailRowExpandedChanged
        Session("PermohonanID") = TryCast(sender, DevExpress.Web.ASPxGridView.ASPxGridView).GetRowValues(e.VisibleIndex, "PermohonanID")
    End Sub

#End Region

#Region " Criteria "
    Protected Sub buatCriteria(ByVal items As String)
        Dim firstAttribute As Boolean = True
        Dim x As Integer = 0
        Dim PD As New XPCollection(Of PermohonanDetail)(session1, CriteriaOperator.Parse("JenisIzinID='" & items.ToString & "'"))
        Dim sb As New StringBuilder
        If PD IsNot Nothing And PD.Count > 0 Then
            For x = 0 To PD.Count - 1
                If firstAttribute Then
                    firstAttribute = False
                Else
                    sb.Append(" OR ")
                End If
                sb.AppendFormat("[{0}]='{1}'", "PermohonanDetailID", PD.Object(x).PermohonanDetailID)
            Next
            Dim criteria As String = sb.ToString()
            serachPermohonanXpoDataSource.Criteria = criteria
            serachPermohonanXpoDataSource.DataBind()
        End If
    End Sub

    Protected Sub ComboJenisIzin_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ComboJenisIzin.Load
        ComboJenisIzin.ValueType.GetFields()
    End Sub

    Protected Sub ComboJenisIzin_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ComboJenisIzin.SelectedIndexChanged
        Dim JenisIzinID As String = CStr(ComboJenisIzin.Value)
        buatCriteria(JenisIzinID)
        GridPermohonan.DataBind()
    End Sub

#End Region
End Class



