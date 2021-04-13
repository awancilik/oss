Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_TDI_TDIBAP
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        BAPXpoDataSource.session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Cek Permohonan - PD - Cek TDI "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click

        If NoPermohonanASPxTextBox.Text.Trim IsNot Nothing Then
            If CekPermohonan(NoPermohonanASPxTextBox.Text.Trim) = True Then
                BAPDetailView.Visible = True
                BAPDetailView.ChangeMode(DetailsViewMode.Insert)
            End If
        Else
            BAPDetailView.Visible = False
        End If
    End Sub

    Private Function CekPermohonan(ByVal noPermohonan As String) As Boolean
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        If objPermohonan IsNot Nothing Then
            If CekPD(objPermohonan.PermohonanID.ToString) = True Then
                Return True
            End If
        Else
            Return False
        End If
    End Function

    Private Function CekPD(ByVal permohonanid As String) As Boolean
        Dim queryCrit As CriteriaOperator = CriteriaOperator.Parse("JenisIzinNama='TDI'")
        Dim izinid As JenisIzin = DirectCast(session1.FindObject(GetType(JenisIzin), queryCrit), JenisIzin)
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "' And JenisIzinID='" & izinid.JenisIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), query2), PermohonanDetail)
        If objPD IsNot Nothing Then
            If CekTDI(objPD.PermohonanIzinID.ToString) = True Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekTDI(ByVal TDIID As String) As Boolean
        Dim query3 As CriteriaOperator = CriteriaOperator.Parse("TDIID='" & TDIID & "'")
        Dim objTDI As TDI = DirectCast(session1.FindObject(GetType(TDI), query3), TDI)
       If objTDI IsNot Nothing Then
            Session("TDIID") = objTDI.TDIID
            Return True
        Else
            Session("TDIID") = Nothing
            Return False
        End If
    End Function
#End Region

    Protected Sub BAPDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles BAPDetailView.ItemUpdating
        e.NewValues("TDIBAPID") = Guid.NewGuid
        e.NewValues("TDIID!Key") = Session("TDIID")
    End Sub
End Class
