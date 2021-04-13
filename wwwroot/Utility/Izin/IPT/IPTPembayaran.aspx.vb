Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_IPT_IPTPembayaran
    Inherits System.Web.UI.Page
    Private session1 As New Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        IPTPembayaranXpoDataSource.Session = session1
        RekeningXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim permohonanID As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonanASPxTextBox.Text.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), permohonanID), Permohonan)
        If objPermohonan IsNot Nothing Then
            If cekIPT(objPermohonan) = True Then
                IPTPembayaranDetailsView.Visible = True
                IPTPembayaranDetailsView.ChangeMode(DetailsViewMode.Edit)
                IPTPembayaranDetailsView.DataBind()
            End If
        Else
            TidakDitemukanASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub

    Private Function cekIPT(ByVal obj As Permohonan) As Boolean
        Dim IPTid As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & obj.PermohonanID.ToString & "'")
        Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), IPTid), IPT)
        If objIPT IsNot Nothing Then
            Session("IPTID") = objIPT.IPTID
            Session("objIPT") = objIPT
            Return True
        Else
            Session("IPTID") = Nothing
            Return False
        End If
    End Function

    Protected Sub IPTPembayaranDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles IPTPembayaranDetailsView.DataBound
        If Session("PermohonanID") IsNot Nothing Then
            Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
            Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), criteria), IPT)
            If objIPT IsNot Nothing Then
                Dim dv As DetailsView = DirectCast(sender, DetailsView)
                If dv.FindControl("rekeningASPxComboBox") IsNot Nothing Then
                    Dim cb As ASPxComboBox = DirectCast(dv.FindControl("rekeningASPxComboBox"), ASPxComboBox)
                    If Not objIPT.rek_id.Equals(Nothing) Then
                        Dim rek As Rekening = DirectCast(session1.GetObjectByKey(GetType(Rekening), objIPT.rek_id), Rekening)
                        cb.Value = rek.rek_id
                        cb.Text = rek.rekening
                    End If
                End If
            End If
        Else
            Dim crit As CriteriaOperator = CriteriaOperator.Parse("IPTID='" & Session("IPTID").ToString & "'")
            Dim iptid As IPT = DirectCast(session1.FindObject(GetType(IPT), crit), IPT)
            Dim dv As DetailsView = IPTPembayaranDetailsView
            If iptid IsNot Nothing Then
                Dim cbrek As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
                If cbrek IsNot Nothing Then
                    cbrek.Value = iptid.IPTID.ToString
                    cbrek.Text = iptid.rek_id.ToString
                    cbrek.DataBind()
                End If
            End If
        End If
    End Sub

    Protected Sub IPTPembayaranDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles IPTPembayaranDetailsView.ItemUpdated
        IPTPembayaranDetailsView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub IPTPembayaranDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles IPTPembayaranDetailsView.ItemUpdating
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        If dv.FindControl("RekeningASPxCombobox") IsNot Nothing Then
            Dim cb As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
            e.NewValues.Item("rek_id") = cb.Value
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("rek_id") = Nothing
            Session("PermohonanID") = Nothing
        End If
        IPTPembayaranDetailsView.Visible = False
    End Sub

    Protected Sub CetakBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CetakBtn.Click
        Dim nopermohonan As String = noPermohonanASPxTextBox.Text
        Dim bukti As New report_reportPage_IPT_BuktiPembayaran.Parameters(nopermohonan)
        bukti.OpenReportInNewWindow()
    End Sub

End Class
