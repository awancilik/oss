Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors
Partial Class Utility_Izin_IPI_IPIRetribusi
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IPIRetribusiXpoDataSource.Session = session1
    End Sub


    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Permohonan - IPI"

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim permohonanID As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonanASPxTextBox.Text.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), permohonanID), Permohonan)
        If objPermohonan IsNot Nothing Then
            If cekIPI(objPermohonan) = True Then
                IPIRetribusiDetailsView.Visible = True
                IPIRetribusiDetailsView.ChangeMode(DetailsViewMode.Edit)
            End If
        Else
            TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub

    Private Function cekIPI(ByVal obj As Permohonan) As Boolean
        Dim ipiid As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & obj.PermohonanID.ToString & "'")
        Dim objIPI As IPI = DirectCast(session1.FindObject(GetType(IPI), ipiid), IPI)
        If objIPI IsNot Nothing Then
            Session("IPIID") = objIPI.IPIID
            Return True
        Else
            Session("IPIID") = Nothing
            Return False
        End If
    End Function
#End Region

#Region " Retribusi "

#End Region

    Protected Sub IPIRetribusiDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles IPIRetribusiDetailsView.ItemUpdated
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub IPIRetribusiDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles IPIRetribusiDetailsView.ItemUpdating
        Dim ipiid As CriteriaOperator = CriteriaOperator.Parse("IPIID='" & Session("IPIID").ToString & "'")
        Dim objIPI As IPI = DirectCast(session1.FindObject(GetType(IPI), ipiid), IPI)
        If objIPI IsNot Nothing Then
            HitungRetribusi(objIPI)
        End If
    End Sub

    Private Sub HitungRetribusi(ByVal obj As IPI)
        Dim dv As DetailsView = IPIRetribusiDetailsView
        Dim retTextBox As ASPxTextBox = DirectCast(dv.FindControl("RetribusiASPxTextBox"), ASPxTextBox)
        Dim retribusi As Decimal = CDec(retTextBox.Text.Trim)
        Dim read As New Baca

        With obj
            .Retribusi = retribusi
            .RetribusiTerbilang = read.Terbilang(retribusi.ToString)
            .Save()
        End With
    End Sub
End Class
