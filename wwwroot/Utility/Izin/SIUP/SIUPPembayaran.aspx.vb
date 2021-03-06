Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors
Partial Class Utility_Izin_SIUP_SIUPPembayaran
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        SIUPXpoDataSource.Session = session1
        RekeningXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("SIUPID") = Nothing
        End If
    End Sub

#Region " Cek Permohonan - PD - SIUP"

    Protected Sub CarASpxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CarASpxButton.Click
        If NoPermohonanASPxTextBox.Text IsNot Nothing Then
            Dim query As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & NoPermohonanASPxTextBox.Text.Trim & "'")
            Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query), Permohonan)
            If objPermohonan IsNot Nothing Then
                If CekPD(objPermohonan) Then
                    SIUPDetailView.Visible = True
                    SIUPDetailView.ChangeMode(DetailsViewMode.Edit)
                Else
                    TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
                End If
            Else
                TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
            End If
        End If
    End Sub

    Private Function CekPD(ByVal obj As Permohonan) As Boolean
        Dim objPD As PermohonanDetail = session1.FindObject(Of PermohonanDetail)(CriteriaOperator.Parse( _
                                          "JenisIzinID.JenisIzinNama LIKE 'SIUP%' And PermohonanID='" & obj.PermohonanID.ToString & _
                                          "'"))
        If objPD IsNot Nothing Then
            If CekSIUP(objPD) Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Function CekSIUP(ByVal obj As PermohonanDetail) As Boolean
        Dim siupID As CriteriaOperator = CriteriaOperator.Parse("SIUPID='" & obj.PermohonanIzinID.ToString & "'")
        Dim objSIUP As SIUP = DirectCast(session1.FindObject(GetType(SIUP), siupID), SIUP)
        If objSIUP IsNot Nothing Then
            Session("SIUPID") = objSIUP.SIUPID
            Return True
        Else
            Session("SIUPID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region "Detail View"

    Protected Sub SIUPDetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles SIUPDetailView.DataBound
        Dim dv As DetailsView = SIUPDetailView
        If dv.CurrentMode = DetailsViewMode.Edit Then
            Dim lbRetribusi As ASPxLabel = DirectCast(dv.FindControl("RetribusiASPxLabel"), ASPxLabel)
            Dim obj As SIUP = DirectCast(session1.FindObject(GetType(SIUP), CriteriaOperator.Parse("SIUPID='" & Session("SIUPID").ToString & "'")), SIUP)
            Dim retribusi As Integer = CInt(obj.Retribusi)
            lbRetribusi.Text = "Rp " & CStr(retribusi)
            Session("rek_id") = obj.rek_id.ToString
            Dim cbRekening As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
            If Not String.IsNullOrEmpty(obj.rek_id.ToString) Then
                Dim rekeneingid As Rekening = DirectCast(session1.FindObject(GetType(Rekening), CriteriaOperator.Parse("rek_id='" & obj.rek_id.ToString & "'")), Rekening)
                If rekeneingid IsNot Nothing Then
                    cbRekening.Value = obj.rek_id
                    cbRekening.Text = rekeneingid.rekening
                End If
            End If
        End If
    End Sub

    Protected Sub SIUPDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles SIUPDetailView.ItemUpdated
        SIUPDetailView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub SIUPDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles SIUPDetailView.ItemUpdating
        Dim dv As DetailsView = SIUPDetailView
        Dim cbRek As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
        Session("rek_id") = cbRek.Value.ToString
        Dim rek As Rekening = DirectCast(session1.FindObject(GetType(Rekening), CriteriaOperator.Parse("rek_id='" & Session("rek_id").ToString & "'")), Rekening)
        Dim obj As SIUP = DirectCast(session1.FindObject(GetType(SIUP), CriteriaOperator.Parse("SIUPID='" & Session("SIUPID").ToString & "'")), SIUP)
        If obj IsNot Nothing Then
            obj.rek_id = rek.rek_id
            obj.Save()
        End If
    End Sub
#End Region

End Class
