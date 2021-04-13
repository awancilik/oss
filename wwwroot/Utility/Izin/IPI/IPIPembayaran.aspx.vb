Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_IPI_IPIPembayaran
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IPIPembayaranXpoDataSource.Session = session1
        RekeningXpoDataSource.Session = session1
    End Sub

#Region " Permohonan - IPI "

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim permohonanID As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonanASPxTextBox.Text.Trim & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), permohonanID), Permohonan)
        If objPermohonan IsNot Nothing Then
            If cekIPI(objPermohonan) = True Then
                IPIPembayaranDetailsView.Visible = True
                IPIPembayaranDetailsView.ChangeMode(DetailsViewMode.Edit)
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
            Session("objIPI") = objIPI
            Return True
        Else
            Session("IPIID") = Nothing
            Return False
        End If
    End Function
#End Region

#Region " DetailView "

    Protected Sub IPIPembayaranDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles IPIPembayaranDetailsView.DataBound
        Dim dv As DetailsView = IPIPembayaranDetailsView
        Dim rekCb As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
        If rekCb IsNot Nothing Then
            Dim objIPI As IPI = CType(Session("objIPI"), IPI)
            Dim rekCrit As CriteriaOperator = CriteriaOperator.Parse("rek_id='" & objIPI.rek_id.ToString & "'")
            Dim rek As Rekening = DirectCast(session1.FindObject(GetType(Rekening), rekCrit), Rekening)
            If rek IsNot Nothing Then
                rekCb.Value = rek.rek_id
                rekCb.Text = rek.rekening
            End If
        End If
    End Sub

    Protected Sub IPIPembayaranDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles IPIPembayaranDetailsView.ItemUpdated
        IPIPembayaranDetailsView.Visible = False
        TersimpanASPxPopupControl.ShowOnPageLoad = True
    End Sub

    Protected Sub IPIPembayaranDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles IPIPembayaranDetailsView.ItemUpdating
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        Dim rekCb As ASPxComboBox = DirectCast(dv.FindControl("RekeningASPxCombobox"), ASPxComboBox)
        If rekCb IsNot Nothing Then
            e.NewValues.Item("rek_id") = rekCb.Value
        End If
    End Sub

#End Region

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("IPIID") = Nothing
        End If
    End Sub
End Class
