Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports System
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_HO_HOPembayaran
    Inherits System.Web.UI.Page
    Private session1 As New Session

#Region " Xpo "

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        HOUlangDataSource.Session = session1
        rekeningXpoDataSource.Session = session1
        XpoDataSourceHO.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("rek_id") = Nothing
            Session("PermohonanID") = Nothing
        End If
        HOPembayaranDetailsView.Visible = False
        ReRegisDetailView.Visible = False
    End Sub

#End Region

#Region " Cari "

    Protected Sub ButtonNomorPermohonan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonNomorPermohonan.Click
        Dim permohonanID As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & TxtNomorPermohonan.Text.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), permohonanID), Permohonan)
        If objPermohonan IsNot Nothing Then
            If cekJP(objPermohonan.PermohonanID.ToString) = True Then
                If cekHO(objPermohonan) = True Then
                    HOPembayaranDetailsView.Visible = True
                    ReRegisDetailView.Visible = False
                    HOPembayaranDetailsView.ChangeMode(DetailsViewMode.Edit)
                    HOPembayaranDetailsView.DataBind()
                End If
            ElseIf objPermohonan IsNot Nothing Then
                If cekHO(objPermohonan) = True Then
                    HOPembayaranDetailsView.Visible = False
                    ReRegisDetailView.Visible = True
                    ReRegisDetailView.ChangeMode(DetailsViewMode.Edit)
                    ReRegisDetailView.DataBind()
                End If
            End If
        End If
    End Sub

    Private Function cekJP(ByVal permohonanid As String) As Boolean
        Dim queryCrit2 As CriteriaOperator = CriteriaOperator.Parse("JenisPermohonanIzinID='81B1066B-3A1B-42E8-9664-19AD865CB4F8'")
        Dim jpNama As JenisPermohonanIzin = DirectCast(session1.FindObject(GetType(JenisPermohonanIzin), queryCrit2), JenisPermohonanIzin)
        Dim queryCrit3 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & permohonanid & "'And JenisPermohonanIzinID='" _
                                             & jpNama.JenisPermohonanIzinID.ToString & "'")
        Dim objPD As PermohonanDetail = DirectCast(session1.FindObject(GetType(PermohonanDetail), queryCrit3), PermohonanDetail)
        If objPD Is Nothing Then
            Return True
        Else
            Return False
        End If

    End Function

    Private Function cekHO(ByVal obj As Permohonan) As Boolean
        Dim HOid As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & obj.PermohonanID.ToString & "'")
        Dim objHO As HO = DirectCast(session1.FindObject(GetType(HO), HOid), HO)
        If objHO IsNot Nothing Then
            Session("HOID") = objHO.HOID
            Session("objHO") = objHO
            HOPembayaranDetailsView.ChangeMode(DetailsViewMode.Edit)
            Return True
        Else
            Session("HOID") = Nothing
            Return False
        End If
    End Function

#End Region

#Region " Detail View "

    Protected Sub HOPembayaranDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles HOPembayaranDetailsView.DataBound
        If Session("HOID") IsNot Nothing Then
            Dim criteria As CriteriaOperator = CriteriaOperator.Parse("HOID = '" & Session("HOID").ToString & "'")
            Dim objHO As HO = DirectCast(session1.FindObject(GetType(HO), criteria), HO)
            If objHO IsNot Nothing Then
                Dim dv As DetailsView = DirectCast(sender, DetailsView)
                If dv.FindControl("rekeningASPxComboBox") IsNot Nothing Then
                    Dim cb As ASPxComboBox = DirectCast(dv.FindControl("rekeningASPxComboBox"), ASPxComboBox)
                    If Not objHO.rek_id.Equals(Nothing) And Not objHO.Retribusi.Equals(Nothing) Then
                        Dim rek As Rekening = DirectCast(session1.GetObjectByKey(GetType(Rekening), objHO.rek_id), Rekening)
                        cb.Value = rek.rek_id
                        cb.Text = rek.rekening
                        cb.DataBind()
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub HOPembayaranDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles HOPembayaranDetailsView.ItemUpdating
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        If dv.FindControl("rekeningASPxComboBox") IsNot Nothing Then
            Dim cb As ASPxComboBox = DirectCast(dv.FindControl("rekeningASPxComboBox"), ASPxComboBox)
            e.NewValues.Item("rek_id") = cb.Value
        End If
    End Sub

    Protected Sub ButtonCetakTandaBukti_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonCetakTandaBukti.Click
        Dim nopermohonan As String = TxtNomorPermohonan.Text
        Dim tbpHO As New TBPHO.Parameters(nopermohonan)
        tbpHO.OpenReportInNewWindow()
    End Sub

    Protected Sub ReRegisDetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReRegisDetailView.DataBound
        If Session("HOID") IsNot Nothing Then
            Dim criteria As CriteriaOperator = CriteriaOperator.Parse("HOID='" & Session("HOID").ToString & "'")
            Dim objho As HO = DirectCast(session1.FindObject(GetType(HO), criteria), HO)
            Dim nilai As Double = 0.5
            If objho IsNot Nothing Then
                Dim dv As DetailsView = ReRegisDetailView
                Dim cb As ASPxComboBox = DirectCast(dv.FindControl("rekeningASPxComboBox"), ASPxComboBox)
                Dim cbRetUlang As ASPxTextBox = DirectCast(dv.FindControl("RetriUlangTxtBox"), ASPxTextBox)
                If Not objho.rek_id.Equals(Nothing) And Not objho.Retribusi.Equals(Nothing) Then
                    Dim rek As Rekening = DirectCast(session1.GetObjectByKey(GetType(Rekening), objho.rek_id), Rekening)
                    cb.Value = rek.rek_id
                    cb.Text = rek.rekening
                    cb.DataBind()

                    cbRetUlang.Value = objho.HOID
                    cbRetUlang.Text = CStr(objho.Retribusi * nilai)
                    cbRetUlang.DataBind()
                End If
            End If
        End If
    End Sub

    Protected Sub ReRegisDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles ReRegisDetailView.ItemUpdated
        ASPxPopupControlSimpan.ShowOnPageLoad = True
    End Sub

    Protected Sub ReRegisDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles ReRegisDetailView.ItemUpdating
        Dim dv As DetailsView = ReRegisDetailView
        Dim cbRetUlang As ASPxTextBox = DirectCast(dv.FindControl("RetriUlangTxtBox"), ASPxTextBox)
        Dim rek As ASPxComboBox = DirectCast(dv.FindControl("rekeningASPxComboBox"), ASPxComboBox)
        If cbRetUlang IsNot Nothing And rek IsNot Nothing Then
            e.NewValues.Item("RetriDaftarUlang") = Session("RetriDaftarUlang")
            e.NewValues.Item("RetriDaftarUlang") = cbRetUlang.Value
            e.NewValues.Item("rek_id") = rek.Value
        End If
    End Sub

#End Region

End Class
