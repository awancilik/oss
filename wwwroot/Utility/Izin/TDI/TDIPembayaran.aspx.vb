Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxEditors

Partial Class Utility_Izin_TDI_TDIPembayaran
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        tdiPembayaranXpoDataSource.Session = session1
        RekeningXpoDataSource.Session = session1
    End Sub
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub
#Region " Permohonan - TDI "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim query1 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & NoPermohonanASpxTextBox.Text.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), query1), Permohonan)
        If objPermohonan IsNot Nothing Then
            If CekTDI(objPermohonan) = True Then
                tdiPembayaranDetailsView.Visible = True
                tdiPembayaranDetailsView.ChangeMode(DetailsViewMode.Edit)
            Else
                tdiPembayaranDetailsView.Visible = False
                TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
            End If
        Else
            tdiPembayaranDetailsView.Visible = False
            TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub

    Private Function CekTDI(ByVal obj As Permohonan) As Boolean
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

    Protected Sub tdiPembayaranDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles tdiPembayaranDetailsView.DataBound
        Dim dv As DetailsView = tdiPembayaranDetailsView
        Dim lbRetribusi As ASPxLabel = DirectCast(dv.FindControl("RetribusiASPxLabel"), ASPxLabel)
        Dim cbRekening As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
        If dv.CurrentMode = DetailsViewMode.Edit Then
            Dim obj As TDI = DirectCast(session1.FindObject(GetType(TDI), CriteriaOperator.Parse("TDIID='" & Session("TDIID").ToString & "'")), TDI)
            If obj IsNot Nothing Then
                If CStr(obj.Retribusi) IsNot Nothing Then
                    lbRetribusi.Text = CInt(obj.Retribusi).ToString
                End If
                If CStr(obj.rek_id.ToString) IsNot Nothing Then
                    Session("rek_id") = obj.rek_id
                    Dim query As CriteriaOperator = CriteriaOperator.Parse("rek_id='" & Session("rek_id").ToString & "'")
                    Dim rekeningid As Rekening = DirectCast(session1.FindObject(GetType(Rekening), query), Rekening)
                    If rekeningid IsNot Nothing Then
                        cbRekening.Value = obj.rek_id
                        cbRekening.Text = rekeningid.rekening
                    End If
                End If
            End If
        End If
    End Sub
    Protected Sub tdiPembayaranDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles tdiPembayaranDetailsView.ItemUpdated
        tdiPembayaranDetailsView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub
    Protected Sub tdiPembayaranDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles tdiPembayaranDetailsView.ItemUpdating
        Dim dv As DetailsView = tdiPembayaranDetailsView
        Dim cbRekening As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
        Dim obj As TDI = DirectCast(session1.FindObject(GetType(TDI), CriteriaOperator.Parse("TDIID='" & Session("TDIID").ToString & "'")), TDI)
        Dim query As CriteriaOperator
        If cbRekening.Value IsNot Nothing Then
            query = CriteriaOperator.Parse("rek_id='" & cbRekening.Value.ToString & "'")
        Else
            query = CriteriaOperator.Parse("rek_id='" & Session("rek_id").ToString & "'")
        End If
        Dim rekeningid As Rekening = DirectCast(session1.FindObject(GetType(Rekening), query), Rekening)
        If obj IsNot Nothing And rekeningid IsNot Nothing Then
            obj.rek_id = rekeningid.rek_id
            obj.Save()
        End If
    End Sub

#End Region
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("TDIID") = Nothing
            Session("rek_id") = Nothing
        End If
    End Sub


End Class
