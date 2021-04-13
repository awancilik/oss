Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_HO_HOPemeriksaan
    Inherits System.Web.UI.Page
    Private session1 As Session

#Region " Xpo "
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        permohonanXpoDataSource.Session = session1
        HOPemeriksaanXpoDataSource.Session = session1
        HOPemeriksaanDetailXpoDataSource.Session = session1
        timPemeriksaXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("HOID") = Nothing
            Session("HOPemeriksaanID") = Nothing
        End If
    End Sub
#End Region

#Region " HO Pemeriksaan Cek "
    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            Session("PermohonanID") = objPermohonan.PermohonanID
            CheckHO(objPermohonan)
            If CheckPemeriksaan() Then
                bikinASPxButton.Visible = False
            Else
                bikinASPxButton.Visible = True
            End If
            permohonanDetailsView.DataBind()
        Else
            Session("PermohonanID") = Nothing
            permohonanDetailsView.DataBind()
        End If
    End Sub

    Private Sub CheckHO(ByVal obj As Permohonan)
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objHO As HO = DirectCast(session1.FindObject(GetType(HO), criteria), HO)
        If objHO IsNot Nothing Then
            Session("HOID") = objHO.HOID
        Else
            Session("HOID") = Nothing
        End If
    End Sub

    Private Function CheckPemeriksaan() As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
        Dim objPemeriksaan As HOPemeriksaan = DirectCast(session1.FindObject(GetType(HOPemeriksaan), criteria), HOPemeriksaan)
        If objPemeriksaan IsNot Nothing Then
            Session("HOPemeriksaanID") = objPemeriksaan.HOPemeriksaanID
            Return True
        Else
            Session("HOPemeriksaanID") = Nothing
            Return False
        End If
    End Function

    'Private Function buatPeriksa(ByVal h As HO) As Boolean
    '    Dim periksa As New HOPemeriksaan(session1)
    '    periksa.HOPemeriksaanID = Guid.NewGuid
    '    periksa.HOID = h
    '    periksa.Save()
    '    Session("HOPemeriksaanID") = periksa.HOPemeriksaanID
    'End Function

    Protected Sub bikinASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bikinASPxButton.Click
        HOPemeriksaanDetailsView.ChangeMode(DetailsViewMode.Insert)
    End Sub
#End Region

#Region " Detail View "

    Protected Sub HOPemeriksaanDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles HOPemeriksaanDetailsView.DataBound
        'If HOPemeriksaanDetailsView.CurrentMode = DetailsViewMode.Edit Then
        'Dim objpriksa As HOPemeriksaan = session1.FindObject(Of HOPemeriksaan)(New BinaryOperator("HOPemeriksaanID", Session("HOPemeriksaanID")))
        'Dim noperiksalabel As ASPxTextBox = DirectCast(HOPemeriksaanDetailsView.FindControl("nomorPemeriksaanASPxTextBox"), ASPxTextBox)
        'noperiksalabel.Text = objpriksa.HOPemeriksaanNomor
        'End If
    End Sub

    Protected Sub HOPemeriksaanDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles HOPemeriksaanDetailsView.ItemInserted
        If CheckPemeriksaan() Then
            bikinASPxButton.Visible = False
        Else
            bikinASPxButton.Visible = True
        End If
    End Sub

    Protected Sub HOPemeriksaanDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles HOPemeriksaanDetailsView.ItemInserting
        e.Values.Item("PermohonanID") = Session("PermohonanID")
        e.Values.Item("HOID") = Session("HOID")
    End Sub
#End Region

#Region " Grid Row Inserting "
    Protected Sub HOPemeriksaanDetailASPxGridView_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        e.NewValues.Item("HOPemeriksaanID!Key") = Session("HOPemeriksaanID")
    End Sub
#End Region

End Class
