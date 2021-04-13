Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_TDI_TDIRetribusi
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        RetribusiXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Permohonan - TDI "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & NoPermohonanASPxTextBox.Text.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        If objPermohonan IsNot Nothing Then
            If CekPermohonan(objPermohonan) = True Then
                tdiRetribusiDetailsView.Visible = True
                tdiRetribusiDetailsView.ChangeMode(DetailsViewMode.Edit)
            Else
                tdiRetribusiDetailsView.Visible = False
                TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
            End If
        Else
            tdiRetribusiDetailsView.Visible = False
            TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub


    Private Function CekPermohonan(ByVal obj As Permohonan) As Boolean
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & obj.PermohonanID.ToString & "'")
        Dim objTDI As TDI = DirectCast(session1.FindObject(GetType(TDI), query2), TDI)
        If objTDI IsNot Nothing Then
            Session("TDIID") = objTDI.TDIID
            Return True
        Else
            Session("TDIID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region " DetailView "
    Protected Sub tdiRetribusiDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles tdiRetribusiDetailsView.ItemUpdated
        tdiRetribusiDetailsView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("TDIID") = Nothing
        End If
    End Sub
End Class
